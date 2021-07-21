
      window.addEventListener('load', setup);
      // use global variables for these so they can be accessed inside of function scopes
      var myChart;
      var vue;

      async function setup() {
        
        const breakdownData = await getData();
        var categories = Object.keys(breakdownData);

        vue = new Vue({
            el: '#app',
            data: {
                builtData: null,
                selected: null,
                options: categories
              },
            methods: {
                recreateChart() {
                    this.builtData = buildData(breakdownData, this.selected);
                    // recreateChart2()
                    myChart.destroy();
                    buildChart()
                }
            }
        })

        vue.$data.builtData = buildData(breakdownData, categories[0]);

        buildChart();

    }

    function buildChart() {
    const ctx = document.getElementById('myChart').getContext('2d');
    myChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: vue.$data.builtData.keyArray,
            datasets: [
            {
                label: vue.$data.selected,
                data: vue.$data.builtData.valueArray,
                fill: false,
                // https://coolors.co/fec5bb-fcd5ce-fae1dd-f8edeb-e8e8e4-d8e2dc-ece4db-ffe5d9-ffd7ba-fec89a
                backgroundColor : ["#FEC5BB", "#FCD5CE", "#FAE1DD", "#F8EDEB", "#E8E8E4","#D8E2DC","#ECE4DB","#FFE5D9","#FFD7BA","#FEC89A"],
                borderWidth: 1
            }
            ]
        },
        options: { responsive: false, maintainAspectRatio: true }
        });
    }

    function buildData(object, category) {
        // Make sure that Objects are not re-assembled into key array and value array out of order.
        var keys = Object.keys(object[category]);
        keys.sort();
        const keyArray = [];
        const valueArray = [];
        for(var i=0; i<keys.length; ++i){
            keyArray.push(keys[i]);
            valueArray.push(object[category][keys[i]]);
        }
        return { keyArray, valueArray }

    }


    async function getData() {
        return fetch('/data')
        .then(response => response.json())
    }