// C3 Chart js
$(function(){
    "use strict";
    var chart = c3.generate({
        bindto: '#chart-bar', // id of chart wrapper
        data: {
            columns: [
                // each columns data
                ['data1', 11, 8, 15, 18, 19, 17],
                ['data2', 8, 7, 11, 11, 4, 8],
                ['data3', 8, 9, 8, 10, 12, 14],
            ],
            type: 'bar', // default type of chart
            colors: {
                'data1': '#467fcf', // blue            
                'data2': '#5eba00', // green
                'data3': '#f66d9b', // pink
            },
            names: {
                // name of each serie
                'data1': 'Income',            
                'data2': 'Growth',
                'data3': 'Expense',
            }
        },
        axis: {
            x: {
                type: 'category',
                // name of each category
                categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun']
            },
        },
        bar: {
            width: 16
        },
        legend: {
            show: true, //hide legend
        },
        padding: {
            bottom: 20,
            top: 0
        },
    });
});