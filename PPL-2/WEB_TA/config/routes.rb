Rails.application.routes.draw do
  # get 'static_pages/home'
  # get 'static_pages/minutes_of_meeting'
  get 'static_pages/approve_minutes_of_meeting'
  # get 'static_pages/ajukan-topik'
  # get 'static_pages/index'
  root 'sessions#new'
  get '/', to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
  # get '/ta-1/dosen_ta/mahasiswa', :to "dosen_ta#mahasiswa"
  resources :dosens do
    collection do
      get 'pilih_role'
    end
  end

  resources :dosen_ta do
    collection do
      get 'mahasiswa'
      get 'mahasiswa/:nim', :to => "dosen_ta#show"
      get 'mahasiswa_ta2'
      get 'mahasiswa_ta2/:nim', :to => "dosen_ta#show_ta2"
      get 'assignment_topik'
      get 'assignment_penguji'
      get 'assignment_penguji_ta2'
      post 'submit_nilai'
      post 'submit_nilai_ta2'
      post 'approve_seminar1'
      post 'approve_seminar2'
      post 'approve_sidang2'
      post 'disapprove_seminar1'
      post 'disapprove_seminar2'
      post 'disapprove_sidang2'
      post 'do_assignment'
      post 'assign_penguji_seminar1'
      post 'assign_penguji_seminar2'
      post 'assign_penguji_sidang'
      get '*path' => redirect('/dosen_ta/mahasiswa')
    end
  end

  resources :dosen_pembimbing do
    collection do
      get 'dosen_nilai_seminar'
      get 'dosen_nilai_seminar_ta2'
      get 'dosen_nilai_sidang'
      get 'dosen_ajukan_topik'
      get 'approve_bimbingan'
      get 'disapprove_bimbingan'
      get 'bimbingan'
      get 'bimbingan_ta2'
      get 'lihat_bimbingan'
      get 'mahasiswa_ajukan_topik'
      get 'input_berita_acara_sidang'
      get 'input_berita_acara_seminar'
      get 'input_berita_acara_seminar2'
      #get 'bimbingan/:nim', :to => "dosen_pembimbing#show_bimbingan"
      #get 'bimbingan/:nim/:approved', :to => "dosen_pembimbing#approve_bimbingan"
      get 'fetch_nilai_seminar1'
      get 'fetch_nilai_seminar2'
      get 'fetch_nilai_sidang'
      get 'fetch_data_bimbingan1'
      get 'fetch_data_bimbingan2'
      post 'edit_bimbingan'
      post 'save_topik'
      post 'hapus_topik'
      post 'set_topic_availability'
      post 'edit_nilai_seminar'
      post 'save_rank'
      post 'reset_rank'
      post 'edit_nilai_seminar_ta2'
      post 'edit_nilai_sidang'
      #post 'bimbingan', :to => "dosen_pembimbing#approve_bimbingan"
      get '*path' => redirect('/dosen_pembimbing/dosen_nilai_seminar')
    end
  end

  resources :mahasiswa do
    collection do
      get 'mahasiswa_belum_dapat_bimbingan'
      get 'bimbingan'
      get 'mahasiswa_belum_dapat_bimbingan_ta2'
      get 'bimbingan_ta2'
      get 'status_mahasiswa'
      get 'status_mahasiswa_ta2'
      get 'daftar_pengajuan_topik'
      get 'mahasiswa_ajukan_topik'
      get 'fetch_topik_dosen'
      get 'ajukan_bimbingan'
      get 'edit_hasil_bimbingan'
      get 'edit_hasil_bimbingan_ta2'
      post 'save_bimbingan'
      post 'edit_bimbingan'
      post 'edit_bimbingan_ta2'
      get 'ajukan_bimbingan_ta2'
      post 'save_bimbingan_ta2'
      post 'save_topik'
      post 'delete_topik'
      get '*path' => redirect('/')
    end
  end

  resources :tu do
  	collection do
  	  get 'tu_daftar_user'
  	  get 'tu_assign_topik'
  	  get 'tu_lihat_user'
  	  get 'fetch_topik'
  	  get 'fetch_data_mahasiswa'
  	  get 'fetch_data_dosen'
      get 'tu_generate_sk'
      get 'mahasiswa'
      get 'mahasiswa_TAII'
      get 'mahasiswa/:nim', :to => "tu#show"
      get 'mahasiswa_TAII/:nim', :to => "tu#show_TAII"
  	  post 'add_mahasiswa'
  	  post 'add_dosen'
  	  post 'do_assign'
  	  post 'tu_lihat_user'
  	  post 'edit_mahasiswa'
  	  post 'edit_dosen'
  	  post 'delete_mahasiswa'
  	  post 'delete_dosen'
      post 'tu_generate_sk'
      post 'generate_sk'
      post 'input_jadwal_seminar_TAI'
      post 'input_nilai_hadir_TAI'
      post 'input_jadwal_seminar_TAII'
      post 'input_jadwal_sidang_TAII'
      post 'input_nilai_hadir_TAII'
      post 'input_persyaratan_final_TAII'
      get '*path' => redirect('/')
	  end
  end

  resources :admin do
    collection do
      get 'registrasi_user'
      get 'lihat_user'
      get 'fetch_data_mahasiswa'
  	  get 'fetch_data_dosen'
      get 'fetch_data_tu'
  	  get 'fetch_data_admin'
      post 'add_mahasiswa'
  	  post 'add_dosen'
      post 'add_tu'
  	  post 'add_admin'
      post 'edit_mahasiswa'
  	  post 'edit_dosen'
      post 'edit_tu'
  	  post 'edit_admin'
  	  post 'delete_mahasiswa'
  	  post 'delete_dosen'
  	  post 'delete_tu'
  	  post 'delete_admin'
    end
  end
  get '*path' => redirect('/')
end
