var globalnim = "";
var myVar;
function showDiv(nim,status) {
    closeDiv()
    myVar = setInterval(fetchBeritaAcara, 1000);
    globalnim = nim;
    $.ajax({
      url: "fetch_nilai_sidang",
      type: "GET",
      header: 'Content-Type: application/json',
      data: {
        nim: nim
      },
      success: function(response){
        sidang = response.sidang;
        if (status == "pembimbing") {
          document.getElementById('pembimbing_nilai_sidang1').value = sidang.nilai_sidang1_pembimbing;
          document.getElementById('pembimbing_nilai_sidang2').value = sidang.nilai_sidang2_pembimbing;
          document.getElementById('pembimbing_nilai_sidang3').value = sidang.nilai_sidang3_pembimbing;
          document.getElementById('pembimbing_nilai_sidang4').value = sidang.nilai_sidang4_pembimbing;
          document.getElementById('pembimbing_nilai_sidang5').value = sidang.nilai_sidang5_pembimbing;
          document.getElementById('pembimbing_nilai_sidang6').value = sidang.nilai_sidang6_pembimbing;
          document.getElementById('pembimbing_nilai_total').value = sidang.nilai_total_pembimbing;
          document.getElementById('inputNilaiSidangPembimbing').style.display = "block";
          document.getElementById('judul-form-pembimbing').innerHTML = "NILAI SIDANG MAHASISWA NIM "+nim;
          document.getElementById('nim_mahasiswa_pembimbing').value = nim;
          document.getElementById('status_mahasiswa_pembimbing').value = status;
          document.getElementById('beritaacarasidangpembimbing').value = sidang.berita_acara;
        } else {
          if (response.no == 1){
            document.getElementById('nilai_sidang1').value = sidang.nilai_sidang1_penguji1;
            document.getElementById('nilai_sidang2').value = sidang.nilai_sidang2_penguji1;
            document.getElementById('nilai_sidang3').value = sidang.nilai_sidang3_penguji1;
            document.getElementById('nilai_sidang4').value = sidang.nilai_sidang4_penguji1;
            document.getElementById('nilai_sidang5').value = sidang.nilai_sidang5_penguji1;
            document.getElementById('nilai_sidang6').value = sidang.nilai_sidang6_penguji1;
            document.getElementById('nilai_total').value = sidang.nilai_total_penguji1;
          } else {
            document.getElementById('nilai_sidang1').value = sidang.nilai_sidang1_penguji2;
            document.getElementById('nilai_sidang2').value = sidang.nilai_sidang2_penguji2;
            document.getElementById('nilai_sidang3').value = sidang.nilai_sidang3_penguji2;
            document.getElementById('nilai_sidang4').value = sidang.nilai_sidang4_penguji2;
            document.getElementById('nilai_sidang5').value = sidang.nilai_sidang5_penguji2;
            document.getElementById('nilai_sidang6').value = sidang.nilai_sidang6_penguji2;
            document.getElementById('nilai_total').value = sidang.nilai_total_penguji2;
          }

          document.getElementById('beritaacarasidangpenguji').value = sidang.berita_acara;
          document.getElementById('inputNilaiSidangPenguji').style.display = "block";
          document.getElementById('judul-form-penguji').innerHTML = "NILAI SIDANG MAHASISWA NIM "+nim;
          document.getElementById('nim_mahasiswa_penguji').value = nim;
          document.getElementById('status_mahasiswa_penguji').value = status;
        }
      },
    })
  }


  function fetchBeritaAcara() {
    $.ajax({
      url: "fetch_nilai_sidang",
      type: "GET",
      header: 'Content-Type: application/json',
      data: {
        nim: globalnim
      },
      success: function(response){
        sidang = response.sidang;
        document.getElementById('beritaacarasidangpenguji').value = sidang.berita_acara;
        document.getElementById('beritaacarasidangpembimbing').value = sidang.berita_acara;
      },
    })
  }

  function closeDiv() {
    document.getElementById('inputNilaiSidangPenguji').style.display = "none";
    document.getElementById('inputNilaiSidangPembimbing').style.display = "none";
    clearInterval(myVar);
  }

  $(function() {
        $('input[name=role]').on('click init-post-format', function() {
            closeDiv();
            $('#listMahasiswaPembimbing').toggle($('#rolePembimbing').prop('checked'));
        }).trigger('init-post-format');
    });

    $(function() {
        $('input[name=role]').on('click init-post-format', function() {
            closeDiv();
            $('#listMahasiswaPenguji').toggle($('#rolePenguji').prop('checked'));
        }).trigger('init-post-format');
    });

    function counterNilai() {
      utama = 0;
      penting = 0;
      pendukung = 0;
      if ($('#nilai_sidang1').find(":selected").text() == '+') {
        utama++;
      }
      if ($('#nilai_sidang2').find(":selected").text() == '+') {
        utama++;
      }
      if ($('#nilai_sidang3').find(":selected").text() == '+') {
        penting++;
      }
      if ($('#nilai_sidang4').find(":selected").text() == '+') {
        pendukung++;
      }
      if ($('#nilai_sidang5').find(":selected").text() == '+') {
        pendukung++;
      }
      if ($('#nilai_sidang6').find(":selected").text() == '+') {
        pendukung++;
      }
      if ((utama == 2) && (penting == 1) && (pendukung >= 2)) {
        $('#nilai_total').val('A');
      } else if ((utama == 2) && (penting == 0) && (pendukung == 3)) {
        $('#nilai_total').val('AB');
      } else if ((utama == 2) && (penting == 1) && (pendukung == 1)) {
        $('#nilai_total').val('AB');
      } else if ((utama == 2) && (penting == 0) && (pendukung >= 2)) {
        $('#nilai_total').val('B');
      } else if ((utama == 2) && (penting == 1) && (pendukung == 0)) {
        $('#nilai_total').val('B');
      } else if (utama == 2) {
        $('#nilai_total').val('BC');
      } else if (utama == 1) {
        $('#nilai_total').val('C');
      } else if ((utama == 0) && (penting == 0) && (pendukung == 0)) {
        $('#nilai_total').val('E');
      } else if (utama == 0) {
        $('#nilai_total').val('D');
      }
    }

    function counterNilaiPembimbing() {
      utama = 0;
      pendukung = 0;
      if ($('#pembimbing_nilai_sidang1').find(":selected").text() == '+') {
        utama++;
      }
      if ($('#pembimbing_nilai_sidang2').find(":selected").text() == '+') {
        utama++;
      }
      if ($('#pembimbing_nilai_sidang3').find(":selected").text() == '+') {
        utama++;
      }
      if ($('#pembimbing_nilai_sidang4').find(":selected").text() == '+') {
        pendukung++;
      }
      if ($('#pembimbing_nilai_sidang5').find(":selected").text() == '+') {
        pendukung++;
      }
      if ($('#pembimbing_nilai_sidang6').find(":selected").text() == '+') {
        pendukung++;
      }
      if ((utama == 3) && (pendukung >= 2)) {
        $('#pembimbing_nilai_total').val('A');
      } else if ((utama == 2) && (pendukung == 3)) {
        $('#pembimbing_nilai_total').val('AB');
      } else if ((utama == 3) && (pendukung == 1)) {
        $('#pembimbing_nilai_total').val('AB');
      } else if ((utama == 2) && (pendukung >= 2)) {
        $('#pembimbing_nilai_total').val('B');
      } else if ((utama == 3) && (pendukung == 0)) {
        $('#pembimbing_nilai_total').val('B');
      } else if (utama == 2) {
        $('#pembimbing_nilai_total').val('BC');
      } else if (utama == 1) {
        $('#pembimbing_nilai_total').val('C');
      } else if ((utama == 0) && (pendukung == 0)) {
        $('#pembimbing_nilai_total').val('E');
      } else if (utama == 0) {
        $('#pembimbing_nilai_total').val('D');
      }
    }

    $(document).ready(function() {
        $('#nilai_sidang1').change(function() {
            counterNilai();
        });
        $('#nilai_sidang2').change(function() {
            counterNilai();
        });
        $('#nilai_sidang3').change(function() {
            counterNilai();
        });
        $('#nilai_sidang4').change(function() {
            counterNilai();
        });
        $('#nilai_sidang5').change(function() {
            counterNilai();
        });
        $('#nilai_sidang6').change(function() {
            counterNilai();
        });

        $('#pembimbing_nilai_sidang1').change(function() {
            counterNilaiPembimbing();
        });
        $('#pembimbing_nilai_sidang2').change(function() {
            counterNilaiPembimbing();
        });
        $('#pembimbing_nilai_sidang3').change(function() {
            counterNilaiPembimbing();
        });
        $('#pembimbing_nilai_sidang4').change(function() {
            counterNilaiPembimbing();
        });
        $('#pembimbing_nilai_sidang5').change(function() {
            counterNilaiPembimbing();
        });
        $('#pembimbing_nilai_sidang6').change(function() {
            counterNilaiPembimbing();
        });
        $("#beritaacarasidangpembimbing").on("keyup", function() {
          $.ajax({
            url: "input_berita_acara_sidang",
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
        $("#beritaacarasidangpenguji").on("keyup", function() {
          $.ajax({
            url: "input_berita_acara_sidang",
            type: "GET",
            header: 'Content-Type: application/json',
            data: {
              beritaacara: $(this).val(),
              nim: $("#nim_mahasiswa_penguji").val()
            },
            success: function(response){

            },
          })
        });
    });
