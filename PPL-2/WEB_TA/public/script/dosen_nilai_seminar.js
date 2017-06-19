var globalnim = "";
var myVar;
	function showDiv(nim,status) {
		closeDiv()
    myVar = setInterval(fetchBeritaAcara, 1000);
    globalnim = nim;
			$.ajax({
        url: "fetch_nilai_seminar1",
        type: "GET",
        header: 'Content-Type: application/json',
        data: {
          nim: nim
        },
        success: function(response){
					seminar = response.seminar;
					if (status == "pembimbing") {
						document.getElementById('pembimbing_nilai_seminar1').value = seminar.nilai_seminar1_pembimbing;
						document.getElementById('pembimbing_nilai_seminar2').value = seminar.nilai_seminar2_pembimbing;
						document.getElementById('pembimbing_nilai_seminar3').value = seminar.nilai_seminar3_pembimbing;
						document.getElementById('pembimbing_nilai_seminar4').value = seminar.nilai_seminar4_pembimbing;
						document.getElementById('pembimbing_nilai_seminar4a').value = seminar.nilai_seminar4a_pembimbing;
						document.getElementById('pembimbing_nilai_seminar4b').value = seminar.nilai_seminar4b_pembimbing;
						document.getElementById('pembimbing_nilai_seminar4c').value = seminar.nilai_seminar4c_pembimbing;
						document.getElementById('pembimbing_nilai_seminar5').value = seminar.nilai_seminar5_pembimbing;
						document.getElementById('pembimbing_nilai_seminar6').value = seminar.nilai_seminar6_pembimbing;
						document.getElementById('pembimbing_nilai_total').value = seminar.nilai_total_pembimbing;
						document.getElementById('inputNilaiSeminarPembimbing').style.display = "block";
						document.getElementById('judul-form-pembimbing').innerHTML = "NILAI SEMINAR MAHASISWA NIM "+nim;
						document.getElementById('nim_mahasiswa_pembimbing').value = nim;
						document.getElementById('status_mahasiswa_pembimbing').value = status;
						document.getElementById('beritaacaraseminarpembimbing').value = seminar.berita_acara;
					} else {
						document.getElementById('nilai_seminar1').value = seminar.nilai_seminar1_penguji;
						document.getElementById('nilai_seminar2').value = seminar.nilai_seminar2_penguji;
						document.getElementById('nilai_seminar3').value = seminar.nilai_seminar3_penguji;
						document.getElementById('nilai_seminar3a').value = seminar.nilai_seminar3a_penguji;
						document.getElementById('nilai_seminar3b').value = seminar.nilai_seminar3b_penguji;
						document.getElementById('nilai_seminar3c').value = seminar.nilai_seminar3c_penguji;
						document.getElementById('nilai_seminar4').value = seminar.nilai_seminar4_penguji;
						document.getElementById('nilai_seminar4a').value = seminar.nilai_seminar4a_penguji;
						document.getElementById('nilai_seminar4b').value = seminar.nilai_seminar4b_penguji;
						document.getElementById('nilai_seminar4c').value = seminar.nilai_seminar4c_penguji;
						document.getElementById('nilai_seminar4d').value = seminar.nilai_seminar4d_penguji;
						document.getElementById('nilai_seminar4e').value = seminar.nilai_seminar4e_penguji;
						document.getElementById('nilai_seminar5').value = seminar.nilai_seminar5_penguji;
						document.getElementById('nilai_seminar6').value = seminar.nilai_seminar6_penguji;
						document.getElementById('nilai_total').value = seminar.nilai_total_penguji;
						document.getElementById('inputNilaiSeminarPenguji').style.display = "block";
						document.getElementById('judul-form-penguji').innerHTML = "NILAI SEMINAR MAHASISWA NIM "+nim;
						document.getElementById('nim_mahasiswa_penguji').value = nim;
						document.getElementById('status_mahasiswa_penguji').value = status;
						document.getElementById('beritaacaraseminarpenguji').value = seminar.berita_acara;
					}
        },
      })
    }

		function fetchBeritaAcara() {
			$.ajax({
	      url: "fetch_nilai_seminar1",
	      type: "GET",
	      header: 'Content-Type: application/json',
	      data: {
	        nim: globalnim
	      },
	      success: function(response){
	        seminar = response.seminar;
	        document.getElementById('beritaacaraseminarpenguji').value = seminar.berita_acara;
	        document.getElementById('beritaacaraseminarpembimbing').value = seminar.berita_acara;
	      },
	    })
	  }

    function closeDiv() {
    	document.getElementById('inputNilaiSeminarPenguji').style.display = "none";
			document.getElementById('inputNilaiSeminarPembimbing').style.display = "none";
			clearInterval(myVar);
		}

			$(function() {
	        $('input[name=role]').on('click init-post-format', function() {
							closeDiv()
	            $('#listMahasiswaPembimbing').toggle($('#rolePembimbing').prop('checked'));
	        }).trigger('init-post-format');
	    });

	    $(function() {
	        $('input[name=role]').on('click init-post-format', function() {
							closeDiv()
	            $('#listMahasiswaPenguji').toggle($('#rolePenguji').prop('checked'));
	        }).trigger('init-post-format');
	    });

			function counterNilai() {
				utama = 0;
				penting = 0;
				pendukung = 0;
				if ($('#nilai_seminar1').find(":selected").text() == '+') {
					utama++;
				}
				if ($('#nilai_seminar2').find(":selected").text() == '+') {
					utama++;
				}
				if ($('#nilai_seminar3').val() == '+') {
					penting++;
				}
				if ($('#nilai_seminar4').val() == '+') {
					pendukung++;
				}
				if ($('#nilai_seminar5').find(":selected").text() == '+') {
					pendukung++;
				}
				if ($('#nilai_seminar6').find(":selected").text() == '+') {
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
				if ($('#pembimbing_nilai_seminar1').find(":selected").text() == '+') {
					utama++;
				}
				if ($('#pembimbing_nilai_seminar2').find(":selected").text() == '+') {
					utama++;
				}
				if ($('#pembimbing_nilai_seminar3').val() == '+') {
					utama++;
				}
				if ($('#pembimbing_nilai_seminar4').val() == '+') {
					pendukung++;
				}
				if ($('#pembimbing_nilai_seminar5').find(":selected").text() == '+') {
					pendukung++;
				}
				if ($('#pembimbing_nilai_seminar6').find(":selected").text() == '+') {
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

			function counterNilai4Pembimbing() {
				if ($('#pembimbing_nilai_seminar4a').find(":selected").text() != '+') {
					$('#pembimbing_nilai_seminar4').val('-');
				} else {
					if (($('#pembimbing_nilai_seminar4b').find(":selected").text() == '+') || ($('#pembimbing_nilai_seminar4c').find(":selected").text() == '+')) {
						$('#pembimbing_nilai_seminar4').val('+');
					} else {
						$('#pembimbing_nilai_seminar4').val('-');
					}
				}
			}

			function counterNilai3() {
				if ($('#nilai_seminar3a').find(":selected").text() != '+') {
					$('#nilai_seminar3').val('-');
				} else {
					if (($('#nilai_seminar3b').find(":selected").text() == '+') || ($('#nilai_seminar3c').find(":selected").text() == '+')) {
						$('#nilai_seminar3').val('+');
					} else {
						$('#nilai_seminar3').val('-');
					}
				}
			}

			function counterNilai4() {
				if ($('#nilai_seminar4a').find(":selected").text() != '+') {
					$('#nilai_seminar4').val('-');
				} else {
					counter = 0;
					if ($('#nilai_seminar4b').find(":selected").text() == '+') {
						counter++;
					}
					if ($('#nilai_seminar4c').find(":selected").text() == '+') {
						counter++;
					}
					if ($('#nilai_seminar4d').find(":selected").text() == '+') {
						counter++;
					}
					if ($('#nilai_seminar4e').find(":selected").text() == '+') {
						counter++;
					}
					if (counter >= 2) {
						$('#nilai_seminar4').val('+');
					} else {
						$('#nilai_seminar4').val('-');
					}
				}
			}

			$(document).ready(function() {
			    $('#nilai_seminar1').change(function() {
							counterNilai();
			    });
					$('#nilai_seminar2').change(function() {
			        counterNilai();
			    });
					$('#nilai_seminar5').change(function() {
			        counterNilai();
			    });
					$('#nilai_seminar6').change(function() {
			        counterNilai();
			    });
					$('#nilai_seminar3a').change(function() {
							counterNilai3()
						  counterNilai();
			    });
					$('#nilai_seminar3b').change(function() {
							counterNilai3()
						  counterNilai();
			    });
					$('#nilai_seminar3c').change(function() {
							counterNilai3()
						  counterNilai();
			    });
					$('#nilai_seminar4a').change(function() {
							counterNilai4()
						  counterNilai();
			    });
					$('#nilai_seminar4b').change(function() {
							counterNilai4()
						  counterNilai();
			    });
					$('#nilai_seminar4c').change(function() {
							counterNilai4()
						  counterNilai();
			    });
					$('#nilai_seminar4d').change(function() {
							counterNilai4()
						  counterNilai();
			    });
					$('#nilai_seminar4e').change(function() {
							counterNilai4()
						  counterNilai();
			    });

					$('#pembimbing_nilai_seminar1').change(function() {
							counterNilaiPembimbing();
			    });
					$('#pembimbing_nilai_seminar2').change(function() {
			        counterNilaiPembimbing();
			    });
					$('#pembimbing_nilai_seminar3').change(function() {
			        counterNilaiPembimbing();
			    });
					$('#pembimbing_nilai_seminar4a').change(function() {
							counterNilai4Pembimbing()
						  counterNilaiPembimbing();
			    });
					$('#pembimbing_nilai_seminar4b').change(function() {
							counterNilai4Pembimbing()
						  counterNilaiPembimbing();
			    });
					$('#pembimbing_nilai_seminar4c').change(function() {
							counterNilai4Pembimbing()
						  counterNilaiPembimbing();
			    });
					$('#pembimbing_nilai_seminar5').change(function() {
			        counterNilaiPembimbing();
			    });
					$('#pembimbing_nilai_seminar6').change(function() {
			        counterNilaiPembimbing();
			    });
					$("#beritaacaraseminarpembimbing").on("keyup", function() {
	          $.ajax({
	            url: "input_berita_acara_seminar",
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
	        $("#beritaacaraseminarpenguji").on("keyup", function() {
	          $.ajax({
	            url: "input_berita_acara_seminar",
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
