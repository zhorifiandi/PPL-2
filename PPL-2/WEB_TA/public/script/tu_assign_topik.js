	function showTopik(nip) {
      
      $.ajax({
        url: "fetch_topik",
        type: "GET",
        header: 'Content-Type: application/json',
        data: {
          nip: nip
        },
        success: function(response){
          var topiks = response.topik;
          document.getElementById('nim').innerHTML = "";
          document.getElementById('nama').innerHTML = "";
          document.getElementById('priority-dosen').innerHTML = "";
          document.getElementById('priority-mahasiswa').innerHTML = "";
          for (x in topiks) {
    		document.getElementById('nim').innerHTML += '<span style="cursor:pointer" onClick="showAssign(\''+nip+'\',\''+topiks[x].dosen+'\',\''+topiks[x].nim+'\',\''+topiks[x].mahasiswa+'\',\''+topiks[x].topik+'\',\''+topiks[x].kategori+'\')">'+topiks[x].nim+'</span><br>';	
    	  }
		  for (x in topiks) {
    		document.getElementById('nama').innerHTML += '<span style="cursor:pointer" onClick="showAssign(\''+nip+'\',\''+topiks[x].dosen+'\',\''+topiks[x].nim+'\',\''+topiks[x].mahasiswa+'\',\''+topiks[x].topik+'\',\''+topiks[x].kategori+'\')">'+topiks[x].mahasiswa+'</span><br>';	
    	  }
    	  for (x in topiks) {
    		document.getElementById('priority-dosen').innerHTML += '<span style="cursor:pointer" onClick="showAssign(\''+nip+'\',\''+topiks[x].dosen+'\',\''+topiks[x].nim+'\',\''+topiks[x].mahasiswa+'\',\''+topiks[x].topik+'\',\''+topiks[x].kategori+'\')">'+topiks[x].prioritas_dosen+'</span><br>';	
    	  }
    	  for (x in topiks) {
    		document.getElementById('priority-mahasiswa').innerHTML += '<span style="cursor:pointer" onClick="showAssign(\''+nip+'\',\''+topiks[x].dosen+'\',\''+topiks[x].nim+'\',\''+topiks[x].mahasiswa+'\',\''+topiks[x].topik+'\',\''+topiks[x].kategori+'\')">'+topiks[x].prioritas_mahasiswa+'</span><br>';	
    	  }
        },
      })
    }
    
    function showAssign(nip,dosen,nim,mahasiswa,topik,kategori) {
    	document.getElementById('judul-form').innerHTML = 'ASSIGNMENT TOPIK MAHASISWA DAN DOSEN';
    	document.getElementById('nama-dosen').innerHTML = "Nama Dosen : "+dosen;
    	document.getElementById('no-nip').innerHTML = "NIP : "+nip;
    	document.getElementById('nama-mahasiswa').innerHTML = "Nama Mahasiswa : "+mahasiswa;
    	document.getElementById('no-nim').innerHTML = "NIM : "+nim;
    	document.getElementById('nama-topik').innerHTML = "Judul Topik : "+topik;
    	document.getElementById('inputAssignment').style.display = "block";	
    	document.getElementById('nip').value = nip;
    	document.getElementById('input_nim').value = nim;
    	document.getElementById('topik').value = topik;
    	document.getElementById('kategori').value = kategori;
    }
    
    function closeDiv() {
    	document.getElementById('inputAssignment').style.display = "none";
    }