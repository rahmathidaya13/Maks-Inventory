  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
      <!-- Brand Logo -->
      <a href="{{ route('dashboard') }}" class="brand-link text-center">
          <span class="brand-text font-weight-light text-uppercase">{{ config('app.name') }}</span>
      </a>

      <!-- Sidebar -->
      <div class="sidebar">
          <!-- Sidebar user panel (optional) -->
          <div class="user-panel mt-3 pb-3 mb-3 d-flex">
              <div class="image">
                  <img src="{{ asset(Auth::user()->photo ? 'assets/profile/' . Auth::user()->photo : 'assets/icon/user.svg') }}"
                      class="img-circle elevation-2 profile" alt="User Image">
              </div>
              <div class="info">
                  <a id="profile-action" data-toggle="modal" data-target="#modal-default-profile" href="#"
                      data-id="{{ Auth::user()->id }}" class="d-block">{{ ucwords(Auth::user()->name) }}</a>
              </div>
          </div>



          <!-- Sidebar Menu -->
          <nav class="mt-2">
              <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                  data-accordion="false">
                  <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
                  <li class="nav-item ">
                      <a href="{{ route('dashboard') }}" class="nav-link {{ Route::is('dashboard') ? 'active' : '' }}">
                          <i class="nav-icon fas fa-tachometer-alt"></i>
                          <p>
                              Dashboard
                          </p>
                      </a>
                  </li>
                  <li class="nav-header">TRANSAKSI</li>
                  <li class="nav-item">
                      <a href="{{ route('transaksi.index') }}" class="nav-link {{ Route::is('transaksi.index') ? 'active' : '' }}">
                          <i class="fas fa-money-check-alt"></i>
                          <p>
                              Transaksi Penjualan
                          </p>
                      </a>
                  </li>
                  <li class="nav-header">BARANG</li>

                  <li class="nav-item">
                      <a href="{{ route('list.index') }}"
                          class="nav-link {{ Route::is('list.index') ? 'active' : '' }}">
                          <i class="nav-icon fas fa-box"></i>
                          <p>
                              Daftar Barang
                          </p>
                      </a>
                  </li>
                  <li class="nav-item">
                      <a href="{{ route('stok.index') }}"
                          class="nav-link {{ Route::is('stok.index') ? 'active' : '' }}">
                          <i class="nav-icon fas fa-boxes"></i>
                          <p>
                              Stok Barang
                          </p>
                      </a>
                  </li>
                  <li class="nav-item">
                      <a href="{{ route('barang_masuk.index') }}"
                          class="nav-link {{ Route::is('barang_masuk.index') ? 'active' : '' }}">
                          <i class="nav-icon fas fa-clipboard-check"></i>
                          <p>
                              Barang Masuk
                          </p>
                      </a>
                  </li>
                  <li class="nav-item">
                      <a href="{{ route('barang_keluar.index') }}" class="nav-link {{ Route::is('barang_keluar.index') ? 'active' : '' }}">
                          <i class="nav-icon fas fa-truck-loading"></i>
                          <p>
                              Barang Keluar
                          </p>
                      </a>
                  </li>
                  <li class="nav-header">AKUN</li>
                  <li class="nav-item">
                      <a onclick="event.preventDefault();document.getElementById('logout-form').submit();"
                          href="{{ route('logout') }}" class="nav-link">
                          <i class="fas fa-sign-out-alt"></i>
                          <p>
                              Keluar
                          </p>
                          <form id="logout-form" action="{{ route('logout') }}" method="POST">
                              @csrf
                          </form>
                      </a>
                  </li>


              </ul>
          </nav>
          <!-- /.sidebar-menu -->
      </div>
      <!-- /.sidebar -->
  </aside>
