<?php
/**
 * Defines an OpenStack Compute virtual server
 *
 * @copyright 2012 Rackspace Hosting, Inc.
 * See COPYING for licensing information
 *
 * @package phpOpenCloud
 * @version 1.0
 * @author Glen Campbell <glen.campbell@rackspace.com>
 */

namespace OpenCloud\Compute;

require_once('persistentobject.inc');
require_once('metadata.inc');

/**
 * The Server class represents a single server node.
 *
 * A Server is always associated with a (Compute) Service. This implementation
 * supports extension attributes OS-DCF:diskConfig, RAX-SERVER:bandwidth,
 * rax-bandwidth:bandwith
 *
 * @api
 * @author Glen Campbell <glen.campbell@rackspace.com>
 */
class Server extends \OpenCloud\PersistentObject {

	const
		JSON_ELEMENT = 'server',
		URL_RESOURCE = 'servers';

	public
		$status,		// server status
		$updated,		// date and time of last update
		$hostId,		// the ID of the host holding the server instance
		$addresses,		// an object holding the server's network addresses
		$links,			// an object with server's permanent and bookmark links
		$image,			// the object object of the server
		$flavor,		// the flavor object of the server
		$networks=array(),	// array of attached networks
		$id,			// the server's ID
		$user_id,		// the user ID that created the server
		$name,			// the server's name
		$created,		// date and time the server was created
		$tenant_id,		// tenant/customer ID that created the server
		$accessIPv4,	// the IPv4 access address
		$accessIPv6,	// the IPv6 access address
		$progress,		// build progress, from 0 (%) to 100 (%)
		$adminPass,		// the root password returned from the Create() method
		$metadata;		// a Metadata object associated with the server

	private
		$personality=array(),	// uploaded file attachments
		$imageRef,				// image reference (for create)
		$flavorRef;				// flavor reference (for create)

	/**
	 * Creates a new Server object and associates it with a Compute service
	 *
	 * @param mixed $info
	 * * If NULL, an empty Server object is created
	 * * If an object, then a Server object is created from the data in the
	 *      object
	 * * If a string, then it's treated as a Server ID and retrieved from the
	 *      service
	 * The normal use case for SDK clients is to treat it as either NULL or an
	 *      ID. The object value parameter is a special case used to construct
	 *      a Server object from a ServerList element to avoid a secondary
	 *      call to the Service.
	 * @throws ServerNotFound if a 404 is returned
	 * @throws UnknownError if another error status is reported
	 */
	public function __construct(\OpenCloud\Compute $service, $info=NULL) {
		// make the service persistent
		parent::__construct($service, $info);

		// the metadata item is an object, not an array
		$this->metadata = $this->Metadata();
	}

	/**
	 * Returns the primary external IP address of the server
	 *
	 * This function is based upon the accessIPv4 and accessIPv6 values.
	 * By default, these are set to the public IP address of the server.
	 * However, these values can be modified by the user; this might happen,
	 * for example, if the server is behind a firewall and needs to be
	 * routed through a NAT device to be reached.
	 *
	 * @api
	 * @param integer $ip_type the type of IP version (4 or 6) to return
	 * @return string IP address
	 */
	public function ip($ip_type=RAXSDK_DEFAULT_IP_VERSION) {
	    switch($ip_type) {
	    case 4:
	        return $this->accessIPv4;
	    case 6:
	        return $this->accessIPv6;
	    default:
	        throw new InvalidIpTypeError(
	            _('Invalid IP address type; must be 4 or 6'));
	    }
	}

        /**
	 * Deletes an vm
	 *
	 * @api
	 * @return HttpResponse
	 * @throws VolumeDeleteError if HTTP status is not Success
	 */
	public function Delete() {
		$this->debug('%s::Delete()', get_class($this));
		$response = $this->Service()->Request($this->Service()->Url().'/'.$this->id, 'DELETE');
		if ($response->HttpStatus() > 204)
			throw new \OpenCloud\DeleteError(sprintf(
				_('Error deleting object [%s], url [%s], status [%d] response [%s]'),
				$this->display_name,
                                $this->Url(),
				$response->HttpStatus(),
				$response->HttpBody()));
		return $response;
	}

	/**
	 * Creates a new server from the data existing in the object
	 *
	 * @api
	 * @param array $params - an associative array of key/value pairs of
	 *      attributes to set on the new server
	 * @param boolean $rebuild - if TRUE, performs a rebuild of an existing
	 *      server
	 * @return HttpResponse - this will include the administrative password
	 *      in the body
	 * @throws \OpenCloud\HttpError
	 * @throws ServerCreateError
	 * @throws UnknownError
	 */
	public function Create($params=array(), $rebuild=FALSE) {
	    // reset values
	    $this->id = NULL;
	    $this->status = NULL;
		foreach($params as $key => $value)
			$this->$key = $value;
		$this->imageRef = $this->image->links[0]->href;
		$this->flavorRef = $this->flavor->links[0]->href;
		$this->debug(_('Server::Create() [%s]'), $this->name);
		$create = $this->CreateJson( $rebuild ? 'rebuild' : 'server' );
		$response = $this->Service()->Request(
			$rebuild ? $this->links[0]->href.'/action' : $this->Service()->Url(),
			'POST',
			array(),
			$create
		);
		if (!is_object($response))
			throw new \OpenCloud\HttpError(sprintf(
			    _('Invalid response for Server::%s() request'),
			    $rebuild ? 'Rebuild' : 'Create'));
		$json = $response->HttpBody();
		if ($response->HttpStatus() >= 300)
			throw new ServerCreateError(
			    sprintf(_('Problem creating server with [%s], '.
			              'status [%d] response [%s]'),
			        $create,
			        $response->HttpStatus(),
			        $response->HttpBody()));
		else if (!$json)
			throw new UnknownError(_('Unexpected error in Server::Create()'));
		else {
			$info = json_decode($json);
			if ($this->CheckJsonError())
				return FALSE;
			foreach($info->server as $item => $value)
				$this->$item = $value;
		}
		return $response;
	}

	/**
	 * Rebuilds an existing server
	 *
	 * @api
	 * @param array $params - an associative array of key/value pairs of
	 *      attributes to set on the new server
     */
    public function Rebuild($params=array()) {
        return $this->Create($params, TRUE);
    }

	/**
	 * Reboots a server
	 *
	 * You can pass the parameter RAXSDK_SOFT_REBOOT (default) or 
	 * RAXSDK_HARD_REBOOT to specify the type of reboot. A "soft" reboot
	 * requests that the operating system reboot itself; a "hard" reboot
	 * is the equivalent of pulling the power plug and then turning it back
	 * on, with a possibility of data loss.
	 *
	 * @api
	 * @param string $type - either 'soft' (the default) or 'hard' to
	 *      indicate the type of reboot
	 * @return boolean TRUE on success; FALSE on failure
	 */
	public function Reboot($type=RAXSDK_SOFT_REBOOT) {
		// create object and json
		$obj = new \stdClass();
		$obj->reboot = new \stdClass();
		$obj->reboot->type = strtoupper($type);
        return $this->Action($obj);
	}


        /**
         * Add floating IP to this instance
         * It has to be allocated to your tenant first!
         *
         * @param string $floating_ip_id IP address of floating IP to assign
         * @author Kris Pajak @ HostBIll
         */
        public function addFloatingIp($floating_ip_address) {
           $obj = new \stdClass();
           $obj->addFloatingIp= new \stdClass();
           $obj->addFloatingIp->address = $floating_ip_address;
           return $this->Action($obj);
        }

        /**
         * Remove floating IP from this instance
         *
         * @param string $floating_ip_id IP address of floating IP to remove
         * @author Kris Pajak @ HostBIll
         */
        public function removeFloatingIp($floating_ip_address) {
           $obj = new \stdClass();
           $obj->removeFloatingIp= new \stdClass();
           $obj->removeFloatingIp->address = $floating_ip_address;
           return $this->Action($obj);
        }

        /**
         * Attach security group to a server
         * @param <type> $security_group
         * @return <type>
         */
         public function addSecurityGroup($security_group) {
           $obj = new \stdClass();
           $obj->addSecurityGroup= new \stdClass();
           $obj->addSecurityGroup->name = $security_group;
           return $this->Action($obj);
        }

         /**
         * Detach security group from a server
         * @param <type> $security_group
         * @return <type>
         */
         public function removeSecurityGroup($security_group) {
           $obj = new \stdClass();
           $obj->removeSecurityGroup= new \stdClass();
           $obj->removeSecurityGroup->name = $security_group;
           return $this->Action($obj);
        }

	/**
	 * Creates a new image from a server
	 *
	 * @api
	 * @param string $name The name of the new image
	 * @param array $metadata Optional metadata to be stored on the image
	 * @return boolean TRUE on success; FALSE on failure
	 */
	public function CreateImage($name, $metadata=array()) {
		if (!strlen($name))
			throw new ImageError(
			    _('Image name is required to create an image'));

		// construct a createImage object for jsonization
		$obj = new \stdClass();
		$obj->createImage = new \stdClass();
		$obj->createImage->name = $name;
		$obj->createImage->metadata = new \stdClass();
		foreach($metadata as $name => $value)
			$obj->createImage->metadata->$name = $value;
        return $this->Action($obj);
	}

	/**
	 * Initiates the resize of a server
	 *
	 * @api
	 * @param Flavor $flavorRef a Flavor object indicating the new server size
	 * @return boolean TRUE on success; FALSE on failure
	 */
	public function Resize($flavorRef) {
		// construct a resize object for jsonization
		$obj = new \stdClass();
		$obj->resize = new \stdClass();
		echo $obj->resize->flavorRef = $flavorRef;
        return $this->Action($obj);
	}

	/**
	 * confirms the resize of a server
	 *
	 * @api
	 * @return boolean TRUE on success; FALSE on failure
	 */
	public function ResizeConfirm() {
	    $obj = new \stdClass();
	    $obj->confirmResize = NULL;
        $res = $this->Action($obj);
        $this->Refresh($this->id);
        return $res;
	}

	/**
	 * reverts the resize of a server
	 *
	 * @api
	 * @return boolean TRUE on success; FALSE on failure
	 */
	public function ResizeRevert() {
	    $obj = new \stdClass();
	    $obj->revertResize = NULL;
        return $this->Action($obj);
	}

	/**
	 * Sets the root password on the server
	 *
	 * @api
	 * @param string $newpasswd The new root password for the server
	 * @return boolean TRUE on success; FALSE on failure
	 */
	public function SetPassword($newpasswd) {
		// construct an object to hold the password
		$obj = new \stdClass();
		$obj->changePassword = new \stdClass();
		$obj->changePassword->adminPass = $newpasswd;
        return $this->Action($obj);
	}


        /**
	 * Fetch VNC console
	 *
	 * @api
	 * @throws ServerActionError if the server has no ID (i.e., has not been created yet)
	 */
	public function Console($type='novnc') {
	    $this->CheckExtension('os-consoles');
	    if (!isset($this->id))
	        throw new \OpenCloud\ServerActionError(
	            _('Server has no ID; cannot fetch console'));
	    $obj = new \stdClass();
		$v = 'os-getVNCConsole';
            $obj->{$v}=new \stdClass();
            $obj->{$v}->type = $type;
	    $resp = $this->Action($obj);
	    $newobj = json_decode($resp->HttpBody());
	    if ($this->CheckJsonError())
	        return FALSE;
	    elseif (!isset($newobj->console))
	        throw new \OpenCloud\ServerActionError(sprintf(
	            _('Console() method failed unexpectedly, '.
	              'status [%s] response [%s]'),
	            $resp->HttpStatus(), $resp->HttpBody()));
	    else
    	    return $newobj->console->url;
	}
/**
         * os-admin-actions
         */
        public function Suspend() {
        $this->CheckExtension('os-admin-actions');
	    if (!isset($this->id))
	        throw new \OpenCloud\ServerActionError(
	            _('Server has no ID; cannot Suspend()'));
            $obj = new \stdClass();
	    $obj->suspend = "none";
            return $this->Action($obj);
        }

/**
         * os-admin-actions
         */
        public function Unsuspend() {
        $this->CheckExtension('os-admin-actions');
	    if (!isset($this->id))
	        throw new \OpenCloud\ServerActionError(
	            _('Server has no ID; cannot UnSuspend()'));
            $obj = new \stdClass();
	    $obj->resume = "none";
            return $this->Action($obj);
        }


        /**
         * os-admin-actions
         */
        public function Pause() {
        $this->CheckExtension('os-admin-actions');
	    if (!isset($this->id))
	        throw new \OpenCloud\ServerActionError(
	            _('Server has no ID; cannot Pause()'));
            $obj = new \stdClass();
	    $obj->pause = "none";
            return $this->Action($obj);
        }

        /**
         * os-admin-actions
         */
        public function UnPause() {
            $this->CheckExtension('os-admin-actions');
	    if (!isset($this->id))
	        throw new \OpenCloud\ServerActionError(
	            _('Server has no ID; cannot UnPause()'));
            $obj = new \stdClass();
	    $obj->unpause = "none";
            return $this->Action($obj);
        }


        /**
	 * Gets console output log
	 *
	 * @api
	 * @return string the root password of the rescue server
	 * @throws ServerActionError if the server has no ID (i.e., has not
	 *      been created yet)
	 */
	public function ConsoleLog() {
            $this->CheckExtension('os-console-output');

	    if (!isset($this->id))
	        throw new \OpenCloud\ServerActionError(
	            _('Server has no ID'));
	    $obj = new \stdClass();
            $v='os-getConsoleOutput';
	    $obj->$v = new \stdClass();
            $obj->$v->length=50;
	    $resp = $this->Action($obj);
	    $newobj = json_decode($resp->HttpBody());
	    if ($this->CheckJsonError())
	        return FALSE;
	    elseif (!isset($newobj->output))
	        throw new \OpenCloud\ServerActionError(sprintf(
	            _(' method failed unexpectedly, '.
	              'status [%s] response [%s]'),
	            $resp->HttpStatus(), $resp->HttpBody()));
	    else
                return $newobj->output;
	}

	/**
	 * Puts the server into *rescue* mode
	 *
	 * @api
	 * @link http://docs.rackspace.com/servers/api/v2/cs-devguide/content/rescue_mode.html
	 * @return string the root password of the rescue server
	 * @throws ServerActionError if the server has no ID (i.e., has not
	 *      been created yet)
	 */
	public function Rescue() {
		$this->CheckExtension('os-rescue');
	    if (!isset($this->id))
	        throw new \OpenCloud\ServerActionError(
	            _('Server has no ID; cannot Rescue()'));
	    $obj = new \stdClass();
	    $obj->rescue = "none";
	    $resp = $this->Action($obj);
	    $newobj = json_decode($resp->HttpBody());
	    if ($this->CheckJsonError())
	        return FALSE;
	    elseif (!isset($newobj->adminPass))
	        throw new \OpenCloud\ServerActionError(sprintf(
	            _('Rescue() method failed unexpectedly, '.
	              'status [%s] response [%s]'),
	            $resp->HttpStatus(), $resp->HttpBody()));
	    else
    	    return $newobj->adminPass;
	}

	/**
	 * Takes the server out of *rescue* mode
	 *
	 * @api
	 * @link http://docs.rackspace.com/servers/api/v2/cs-devguide/content/rescue_mode.html
	 * @return HttpResponse
	 * @throws ServerActionError if the server has no ID (i.e., has not
	 *      been created yet)
     */
    public function Unrescue() {
    	$this->CheckExtension('os-rescue');
	    if (!isset($this->id))
	        throw new \OpenCloud\ServerActionError(
	            _('Server has no ID; cannot Unescue()'));
	    $obj = new \stdClass();
	    $obj->unrescue = NULL;
	    return $this->Action($obj);
    }

	/**
	 * Retrieves the metadata associated with a Server
	 *
	 * If a metadata item name is supplied, then only the single item is
	 * returned. Otherwise, the default is to return all metadata associated
	 * with a server.
	 *
	 * @api
	 * @param string $key - the (optional) name of the metadata item to return
	 * @return OpenCloud\Compute\Metadata object
	 * @throws MetadataError
	 */
	public function Metadata($key=NULL) {
	    /*
		$met = new ServerMetadata($this, $key);
		if (!$key) {
			foreach($this->metadata as $key => $value)
				$met->$key = $value;
		}
		return $met;
		*/
            try{
		return new ServerMetadata($this, $key);
            }catch(MetadataError $e) {
                
            }
	} // function metadata()

	/**
	 * Returns the IP address block for the Server or for a specific network
	 *
	 * @api
	 * @param string $network - if supplied, then only the IP(s) for
	 *      the specified network are returned. Otherwise, all IPs are returned.
	 * @return object
	 * @throws ServerIpsError
	 */
	public function ips($network=NULL) {
		$url = noslash($this->Url('ips/'.$network));
		$response = $this->Service()->Request($url);
		if ($response->HttpStatus() >= 300)
			throw new ServerIpsError(
				sprintf(_('Error in Server::ips(), status [%d], response [%s]'),
					$response->HttpStatus(), $response->HttpBody()));
		$obj = json_decode($response->HttpBody());
		if ($this->CheckJsonError())
			return new \stdClass();
		elseif (isset($obj->addresses))
			return $obj->addresses;
		elseif (isset($obj->network))
			return $obj->network;
		else
			return new \stdClass();
	} // function ips()
	
	/**
	 * Attaches a volume to a server
	 *
	 * Requires the os-volumes extension.
	 *
	 * @api
	 * @param OpenCloud\VolumeService\Volume $vol the volume to attach
	 * @param string $device the device to which to attach it
	 * @throws VolumeError
	 */
	public function AttachVolume(\OpenCloud\VolumeService\Volume $vol, 
								 $device='auto') {
		
		$this->CheckExtension('os-volumes');
		$this->debug('AttachVolume vol=%d device=%s', $vol->id, $device);
	
		// check for os-volume extension and abort if not available
		if (!in_array('os-volumes', $this->Service()->namespaces()))
			throw new VolumeError(_('Volume extension is not available'));
		
		// construct URL
		$url = $this->Url('os-volume_attachments');
		
		// create the payload
		$obj = new \stdClass();
		$obj->volumeAttachment = new \stdClass();
		$obj->volumeAttachment->volumeId = $vol->id;
		if ($device != 'auto')
			$obj->volumeAttachment->device = $device;
		$json = json_encode($obj);
		if ($this->CheckJsonError())
			return;
		
		// submit it
		$response = $this->Service()->Request($url, 'POST', array(), $json);
		
		// check response
		if ($response->HttpStatus() > 204)
			throw new VolumeError(sprintf(
				_('Error attaching volume, request [%s] '.
				  'status [%d] response [%s]'),
				$json, $response->HttpStatus(), $response->HttpBody()));
		
		// return response
		return $response;
	}
	
	/**
	 * removes a volume attachment from a server
	 *
	 * Requires the os-volumes extension.
	 *
	 * @api
	 * @param OpenCloud\VolumeService\Volume $vol the volume to remove
	 * @throws VolumeError
	 */
	public function RemoveVolume(\OpenCloud\VolumeService\Volume $vol) {
		
		$this->CheckExtension('os-volumes');
		$this->debug('RemoveVolume vol=%d', $vol->id);
	
		// check for os-volume extension and abort if not available
		if (!in_array('os-volumes', $this->Service()->namespaces()))
			throw new VolumeError(_('Volume extension is not available'));
		
		// construct URL
		$url = $this->Url('os-volume_attachments/'.$vol->id);
		
		// submit it
		$response = $this->Service()->Request($url, 'DELETE');
		
		// check response
		if ($response->HttpStatus() > 204)
			throw new VolumeError(sprintf(
				_('Error removing volume, request [%s] '.
				  'status [%d] response [%s]'),
				$json, $response->HttpStatus(), $response->HttpBody()));
		
		// return response
		return $response;
	}	 
	
	/**
	 * adds a "personality" file to be uploaded during Create() or Rebuild()
	 *
	 * The `$path` argument specifies where the file will be stored on the
	 * target server; the `$data` is the actual data values to be stored.
	 * To upload a local file, use `file_get_contents('name')` for the `$data`
	 * value.
	 *
	 * @param string $path the file path (up to 255 characters)
	 * @param string $data the file contents (max size set by provider)
	 * @return void
	 * @throws PersonalityError if server already exists (has an ID)
	 */
	public function AddFile($path, $data) {
		// set the value
		$this->personality[$path] = $data;
	}

	/*********** PROTECTED METHODS ***********/

	/**
	 * Creates the JSON for creating a new server
	 *
	 * @param string $element creates {server ...} by default, but can also
	 *      create {rebuild ...} by changing this parameter
	 * @return json
	 */
	protected function CreateJson($element='server') {
        // create a blank object
        $obj = new \stdClass();
        // set a bunch of properties
        $obj->$element = new \stdClass();
        $obj->$element->name = $this->name;
        $obj->$element->imageRef = $this->imageRef;
        $obj->$element->flavorRef = $this->flavorRef;
        $obj->$element->metadata = $this->metadata;
        if($this->adminPass) {
            $obj->$element->adminPass = $this->adminPass;
       }

		if (is_array($this->networks) && count($this->networks)) {
			$obj->$element->networks = array();
			foreach($this->networks as $net) {
			    if (get_class($net) != 'OpenCloud\Compute\Network')
			        throw new Compute\InvalidParameterError(sprintf(
			            _('"networks" parameter must be an array of '.
			              'Compute\Network objects; [%s] found'),
			              get_class($net)));
				$netobj = new \stdClass();
				$netobj->uuid = $net->id;
				$obj->$element->networks[] = $netobj;
			}
		}
		// handle personality files
		if (count($this->personality)) {
			$obj->$element->personality = array();
			foreach($this->personality as $path => $data) {
				$fileobj = new \stdClass();
				$fileobj->path = $path;
				$fileobj->contents = $data;
				$obj->$element->personality[] = $fileobj;
			}
		}
        $json = json_encode($obj);
        return $json;
	}

	/**
	 * creates the JSON for updating a server
	 *
	 * @return json
	 */
	protected function UpdateJson($params) {
		$obj = new \stdClass();
		$obj->server = new \stdClass();
		foreach($params as $name => $value)
			$obj->server->$name = $this->$name;
		return $obj;
	}

	/**
	 * the top-level JSON identifier
	 */
	protected function JsonName() {
		return self::JSON_ELEMENT;
	}

	/**
	 * the URL resource
	 */
	protected function ResourceName() {
		return self::URL_RESOURCE;
	}

} // class Server
