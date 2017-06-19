	function showDiv(nim) {
      
      $.ajax({
        url: "fetch_nilai",
        type: "GET",
        header: 'Content-Type: application/json',
        data: {
          nim: nim
        },
        success: function(response){
          var nilai = response.nilai;

          document.getElementById('inputNilaiSeminar').style.display = "block";
		  document.getElementById('judul-form').innerHTML = "NILAI SEMINAR MAHASISWA NIM "+nim;
		  document.getElementById('input_nilai').value = nilai;
		  document.getElementById('nim').value = nim;
        },
      })
    }
    
    function closeDiv() {
    	document.getElementById('inputNilaiSeminar').style.display = "none";
    }