	$(function() {
        $('input[name=list]').on('click init-post-format', function() {
            $('#listDataMahasiswa').toggle($('#listMahasiswa').prop('checked'));
        }).trigger('init-post-format');
    });

    $(function() {
        $('input[name=list]').on('click init-post-format', function() {
            $('#listDataDosen').toggle($('#listDosen').prop('checked'));
        }).trigger('init-post-format');
    });

    $(function() {
        $('input[name=list]').on('click init-post-format', function() {
            $('#listDataTU').toggle($('#listTU').prop('checked'));
        }).trigger('init-post-format');
    });

		$(function() {
        $('input[name=list]').on('click init-post-format', function() {
            $('#listDataAdmin').toggle($('#listAdmin').prop('checked'));
        }).trigger('init-post-format');
    });

    function showDataMahasiswa(nim) {

      $.ajax({
        url: "fetch_data_mahasiswa",
        type: "GET",
        header: 'Content-Type: application/json',
        data: {
          nim: nim
        },
        success: function(response){
					document.getElementById('editMahasiswa').style.display = "none";
		    	document.getElementById('editDosen').style.display = "none";
		    	document.getElementById('editTU').style.display = "none";
		    	document.getElementById('editAdmin').style.display = "none";
          document.getElementById('editMahasiswa').style.display = "block";
          var mahasiswa = response.mahasiswa;
          var bimbingan = response.bimbingan;
          var dosen = response.dosen;
          document.getElementById('nim').value = mahasiswa.nim;
          document.getElementById('oldNim').value = mahasiswa.nim;
          document.getElementById('nama').value = mahasiswa.name;
          document.getElementById('topik').value = bimbingan.judul_topik;
          document.getElementById('kategori').value = bimbingan.kategori_topik;
          document.getElementById('dosen').value = dosen.name;
          document.getElementById('nip').value = bimbingan.nip;
        },
      })
    }

    function showDataDosen(nip) {

      $.ajax({
        url: "fetch_data_dosen",
        type: "GET",
        header: 'Content-Type: application/json',
        data: {
          nip: nip
        },
        success: function(response){
					document.getElementById('editMahasiswa').style.display = "none";
		    	document.getElementById('editDosen').style.display = "none";
		    	document.getElementById('editTU').style.display = "none";
		    	document.getElementById('editAdmin').style.display = "none";
          document.getElementById('editDosen').style.display = "block";
          var dosen = response.dosen;
          document.getElementById('oldNipDosen').value = dosen.nip;
          document.getElementById('nipDosen').value = dosen.nip;
          document.getElementById('namaDosen').value = dosen.nama;
          document.getElementById('labDosen').value = dosen.lab;
					if (dosen.dosenta == 'true') {
						document.getElementById('dosenTA').checked = true;
					}
					if (dosen.dosenpembimbing == 'true') {
						document.getElementById('dosenPembimbing').checked = true;
					}
					if (dosen.dosenpenguji == 'true') {
						document.getElementById('dosenPenguji').checked = true;
					}
			  },
      })
    }

		function showDataTU(nip) {

      $.ajax({
        url: "fetch_data_tu",
        type: "GET",
        header: 'Content-Type: application/json',
        data: {
          nip: nip
        },
        success: function(response){
					document.getElementById('editMahasiswa').style.display = "none";
		    	document.getElementById('editDosen').style.display = "none";
		    	document.getElementById('editTU').style.display = "none";
		    	document.getElementById('editAdmin').style.display = "none";
          document.getElementById('editTU').style.display = "block";
          var tu = response.tu;
          document.getElementById('oldNipTU').value = tu.nip;
          document.getElementById('nipTU').value = tu.nip;
          document.getElementById('namaTU').value = tu.nama;
        },
      })
    }

		function showDataAdmin(nip) {

      $.ajax({
        url: "fetch_data_admin",
        type: "GET",
        header: 'Content-Type: application/json',
        data: {
          nip: nip
        },
        success: function(response){
					document.getElementById('editMahasiswa').style.display = "none";
		    	document.getElementById('editDosen').style.display = "none";
		    	document.getElementById('editTU').style.display = "none";
		    	document.getElementById('editAdmin').style.display = "none";
          document.getElementById('editAdmin').style.display = "block";
          var admin = response.admin;
          document.getElementById('oldNipAdmin').value = admin.nip;
          document.getElementById('nipAdmin').value = admin.nip;
          document.getElementById('namaAdmin').value = admin.nama;
        },
      })
    }

    function closeDiv() {
    	document.getElementById('editMahasiswa').style.display = "none";
    	document.getElementById('editDosen').style.display = "none";
    	document.getElementById('editTU').style.display = "none";
    	document.getElementById('editAdmin').style.display = "none";
    }
