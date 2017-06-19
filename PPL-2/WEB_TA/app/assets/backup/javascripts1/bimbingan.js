  function showBimbinganMahasiswa(nim,nip) {

    $.ajax({
      url: "fetch_data_bimbingan",
      type: "GET",
      header: 'Content-Type: application/json',
      data: {
        nim: nim,
        nip: nip
      },
      success: function(response){
        var bimbingan = response.bimbingan;
        document.getElementById('judul_bimbingan').innerHTML = "DAFTAR BIMBINGAN MAHASISWA NIM "+nim;
        isi = "<table><tr><th>Tanggal</th><th>Status</th><th></th></tr>";
        for (i=0; i<bimbingan.length; i++) {
          isi += "<tr><td>"+bimbingan[i].tanggal+"</td><td>"+bimbingan[i].approved+"</td><td><a href='lihat_bimbingan?id="+bimbingan[i].id+"'>Tinjau</a></td></tr>";
        }
        isi += "</table>";
        if (bimbingan.length==0) {
          document.getElementById('daftar_bimbingan').innerHTML = "<label class='label-form empty-record'> Tidak ada pengajuan bimbingan.</label>";
        } else {
          document.getElementById('daftar_bimbingan').innerHTML = isi;
        }
        document.getElementById('daftar_bimbingan').style.display = "block";
      },
    })
  }

  function approvalBimbingan(id) {

    $.ajax({
      url: "approve_bimbingan",
      type: "GET",
      header: 'Content-Type: application/json',
      data: {
        id: id
      },
      success: function(response){
        var approval = response.approval;
        if (approval == "not_approved") {
          document.getElementById('approval').innerHTML = "SETUJUI";
        } else {
          document.getElementById('approval').innerHTML = "TIDAK SETUJUI";
        }
      },
    })
  }

  function closeDiv() {
    document.getElementById('inputNilaiSeminar').style.display = "none";
  }
