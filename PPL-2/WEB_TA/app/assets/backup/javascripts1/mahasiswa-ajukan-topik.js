    function fetchTopics(ele) {
      var name = ele.id;
      var frontId = name.substring((name.length)-1, name.length);
      var dosbing = document.getElementById('options-dosen'+frontId).value;
      var kategori = document.getElementById('options-kategori'+frontId).value;

      $.ajax({
        url: "fetch_topik_dosen",
        type: "GET",
        header: 'Content-Type: application/json',
        data: {
          dosbing: dosbing,
          kategori: kategori
        },
        success: function(response){
          var select = document.getElementById('options-topik'+frontId);
          var arr = response.arr_topic;

          while (select.hasChildNodes()) {
            select.removeChild(select.lastChild);
          }

          for (var i = 0; i<arr.length; i++){
            var opt = document.createElement('option');
            opt.value = arr[i];
            opt.innerHTML = arr[i];
            select.appendChild(opt);
          }
        },
      })
    }

    function fetchTopicsFirstTime(frontId) {
      var dosbing = document.getElementById('options-dosen'+frontId).value;
      var kategori = document.getElementById('options-kategori'+frontId).value;
      $.ajax({
        url: "fetch_topik_dosen",
        type: "GET",
        header: 'Content-Type: application/json',
        data: {
          dosbing: dosbing,
          kategori: kategori
        },
        success: function(response){
          var select = document.getElementById('options-topik'+frontId);
          var arr = response.arr_topic;

          while (select.hasChildNodes()) {
            select.removeChild(select.lastChild);
          }

          for (var i = 0; i<arr.length; i++){
            var opt = document.createElement('option');
            opt.value = arr[i];
            opt.innerHTML = arr[i];
            select.appendChild(opt);
          }
        },
      })
    }

    function fetchTopicsAll() {
      fetchTopicsFirstTime("1");
      fetchTopicsFirstTime("2");
      fetchTopicsFirstTime("3");
    }
