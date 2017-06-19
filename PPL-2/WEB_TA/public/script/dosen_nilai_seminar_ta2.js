function showDiv(nim,status) {
    closeDiv()
    $.ajax({
      url: "fetch_nilai_seminar2",
      type: "GET",
      header: 'Content-Type: application/json',
      data: {
        nim: nim
      },
      success: function(response){
        seminar_ta2 = response.seminar_ta2;
        if (status == "pembimbing") {
          document.getElementById('pembimbing_nilai_seminar_ta21').value = seminar_ta2.nilai_seminar_ta21_pembimbing;
          document.getElementById('pembimbing_nilai_seminar_ta22').value = seminar_ta2.nilai_seminar_ta22_pembimbing;
          document.getElementById('pembimbing_nilai_seminar_ta23').value = seminar_ta2.nilai_seminar_ta23_pembimbing;
          document.getElementById('pembimbing_nilai_seminar_ta24').value = seminar_ta2.nilai_seminar_ta24_pembimbing;
          document.getElementById('pembimbing_nilai_seminar_ta25').value = seminar_ta2.nilai_seminar_ta25_pembimbing;
          document.getElementById('pembimbing_nilai_seminar_ta26').value = seminar_ta2.nilai_seminar_ta26_pembimbing;
          document.getElementById('pembimbing_nilai_seminar_ta27').value = seminar_ta2.nilai_seminar_ta27_pembimbing;
          document.getElementById('pembimbing_nilai_total').value = seminar_ta2.nilai_total_pembimbing;
          document.getElementById('inputNilaiSeminarTA2Pembimbing').style.display = "block";
          document.getElementById('judul-form-pembimbing').innerHTML = "NILAI SEMINAR TA II MAHASISWA NIM "+nim;
          document.getElementById('nim_mahasiswa_pembimbing').value = nim;
          document.getElementById('status_mahasiswa_pembimbing').value = status;
          document.getElementById('beritaacaraseminar2pembimbing').value = seminar_ta2.berita_acara;
        }
      },
    })
  }

  function closeDiv() {
    document.getElementById('inputNilaiSeminarTA2Pembimbing').style.display = "none";
    // clearInterval(myVar);
  }

    function counterNilaiPembimbing() {
      utama = 0;
      if ($('#pembimbing_nilai_seminar_ta21').find(":selected").text() == '+') {
        utama++;
      }
      if ($('#pembimbing_nilai_seminar_ta22').find(":selected").text() == '+') {
        utama++;
      }
      if ($('#pembimbing_nilai_seminar_ta23').find(":selected").text() == '+') {
        utama++;
      }
      if (utama == 3) {
        $('#pembimbing_nilai_total').val('Siap');
      } else {
        $('#pembimbing_nilai_total').val('Belum Siap');
      }
    }

    $(document).ready(function() {
        $('#pembimbing_nilai_seminar_ta21').change(function() {
            counterNilaiPembimbing();
        });
        $('#pembimbing_nilai_seminar_ta22').change(function() {
            counterNilaiPembimbing();
        });
        $('#pembimbing_nilai_seminar_ta23').change(function() {
            counterNilaiPembimbing();
        });
        $("#beritaacaraseminar2pembimbing").on("keyup", function() {
          $.ajax({
            url: "input_berita_acara_seminar2",
            type: "GET",
            header: 'Content-Type: application/json',
            data: {
              beritaacara: $(this).val(),
              nim: $("#nim_mahasiswa_pembimbing").val()
            },
            success: function(response){

            },
          })
        });
    });
