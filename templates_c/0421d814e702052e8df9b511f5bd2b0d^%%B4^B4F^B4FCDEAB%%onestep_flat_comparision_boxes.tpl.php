<?php /* Smarty version 2.6.26, created on 2018-06-20 15:28:51
         compiled from C:%5Cxampp7%5Chtdocs%5Cspeednova%5Ctemplates%5Corderpages%5Conestep_flat_comparision_boxes.tpl */ ?>
<link media="all" type="text/css" rel="stylesheet" href="<?php echo $this->_tpl_vars['orderpage_dir']; ?>
onestep_flat_comparision_boxes/css/flat-ui.css" />
<link media="all" type="text/css" rel="stylesheet" href="<?php echo $this->_tpl_vars['orderpage_dir']; ?>
onestep_flat_comparision_boxes/css/orderpage.css" />
<script type="text/javascript" src="<?php echo $this->_tpl_vars['orderpage_dir']; ?>
onestep_flat_comparision_boxes/js/bootstrap-select.js"></script>
<script type="text/javascript" src="<?php echo $this->_tpl_vars['orderpage_dir']; ?>
onestep_flat_comparision_boxes/js/flatui-checkbox.js"></script>
<script type="text/javascript" src="<?php echo $this->_tpl_vars['orderpage_dir']; ?>
onestep_flat_comparision_boxes/js/script.js"></script>

<?php $_from = $this->_tpl_vars['categories']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['cats'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['cats']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['i']):
        $this->_foreach['cats']['iteration']++;
?>
<?php if ($this->_tpl_vars['i']['id'] == $this->_tpl_vars['current_cat']): ?><?php $this->assign('category_name', $this->_tpl_vars['i']['name']); ?><?php endif; ?>
<?php endforeach; endif; unset($_from); ?>

<!-- Section: Pricing v.5 -->
<section class="text-center my-5">

  <!-- Section heading -->
  <h2 class="h1-responsive font-weight-bold text-center my-5">Our pricing plans</h2>
  <!-- Section description -->
  <p class="text-center w-responsive mx-auto mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugit, error amet numquam iure provident voluptate esse quasi, veritatis totam voluptas nostrum quisquam eum porro a pariatur veniam.</p>

  <!-- Grid row -->
  <div class="row">

    <!-- Grid column -->
    <div class="col-lg-4 col-md-12 mb-lg-0 mb-4">

      <!-- Card -->
      <div class="pricing-card card">

        <!-- Content -->
        <div class="card-body">
          <h5 class="font-weight-bold mt-3">Basic</h5>

          <!-- Price -->
          <div class="price pt-0">
            <h2 class="number red-text mb-0">10</h2>
          </div>

          <ul class="striped mb-1">
            <li>
              <p><strong>1</strong> project</p>
            </li>
            <li>
              <p><strong>100</strong> components</p>
            </li>
            <li>
              <p><strong>150</strong> features</p>
            </li>
            <li>
              <p><strong>200</strong> members</p>
            </li>
          </ul>
          <a class="btn btn-danger btn-rounded mb-4"> Buy now</a>

        </div>
        <!-- Content -->

      </div>
      <!-- Card -->

    </div>
    <!-- Grid column -->

    <!--  Grid column  -->
    <div class="col-lg-4 col-md-6 mb-md-0 mb-4">

      <!-- Card -->
      <div class="card card-image" style="background-image: url('https://mdbootstrap.com/img/Photos/Others/pricing-table%20(8).jpg');">

        <!-- Pricing card -->
        <div class="text-white text-center pricing-card d-flex align-items-center rgba-indigo-strong py-3 px-3 rounded">

          <!-- Content -->
          <div class="card-body">
            <h5 class="font-weight-bold mt-2">Pro</h5>

            <!--Price -->
            <div class="price pt-0">
              <h2 class="number mb-0">20</h2>
            </div>

            <ul class="striped mb-0">
              <li>
                <p><strong>3</strong> projects</p>
              </li>
              <li>
                <p><strong>200</strong> components</p>
              </li>
              <li>
                <p><strong>250</strong> features</p>
              </li>
              <li>
                <p><strong>300</strong> members</p>
              </li>
            </ul>
            <a class="btn btn-rounded btn-outline-white">Buy now</a>

          </div>
          <!-- Content -->

        </div>
        <!-- Pricing card -->

      </div>
      <!-- Card -->
    </div>
    <!-- Grid column -->

    <!-- Grid column -->
    <div class="col-lg-4 col-md-6">

      <!-- Card -->
      <div class="pricing-card card">

        <!-- Content -->
        <div class="card-body">
          <h5 class="font-weight-bold mt-3">Enterprise</h5>

          <!-- Price -->
          <div class="price pt-0">
            <h2 class="number red-text mb-0">30</h2>
          </div>

          <ul class="striped mb-1">
            <li>
              <p><strong>5</strong> projects</p>
            </li>
            <li>
              <p><strong>300</strong> components</p>
            </li>
            <li>
              <p><strong>350</strong> features</p>
            </li>
            <li>
              <p><strong>400</strong> members</p>
            </li>
          </ul>
          <a class="btn btn-danger btn-rounded mb-4"> Buy now</a>

        </div>
        <!-- Content -->

      </div>
      <!-- Card -->

    </div>
    <!-- Grid column -->

  </div>
  <!-- Grid row -->

</section>
<!-- Section: Pricing v.5 -->
<!-- End of Orderpage -->