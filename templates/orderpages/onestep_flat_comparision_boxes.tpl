{*
@@author:: HostBill team
@@name:: Flat Comparison boxes, One-step
@@description:: A One-Step checkout, where your client can pick package, configure it, add domains, addons, config options and signup, all on one page. Nice clean template with current plan highlighted, designed to hold 4 packages. 
@@thumb:: onestep_flat_comparision_boxes/thumb.png
@@img:: onestep_flat_comparision_boxes/preview.png
*}
<link media="all" type="text/css" rel="stylesheet" href="{$orderpage_dir}onestep_flat_comparision_boxes/css/flat-ui.css" />
<link media="all" type="text/css" rel="stylesheet" href="{$orderpage_dir}onestep_flat_comparision_boxes/css/orderpage.css" />
<script type="text/javascript" src="{$orderpage_dir}onestep_flat_comparision_boxes/js/bootstrap-select.js"></script>
<script type="text/javascript" src="{$orderpage_dir}onestep_flat_comparision_boxes/js/flatui-checkbox.js"></script>
<script type="text/javascript" src="{$orderpage_dir}onestep_flat_comparision_boxes/js/script.js"></script>

{foreach from=$categories item=i name=categories name=cats}
{if $i.id == $current_cat}{assign var=category_name value=$i.name}{/if}
{/foreach}

<!-- Section: Pricing v.5 -->
<section id="content">

<!--start container-->
<div class="container">
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
  </div>
</section>
<!-- Section: Pricing v.5 -->
<!-- End of Orderpage -->
