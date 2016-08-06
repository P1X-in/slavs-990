var objectives = preload('objectives.gd').new().objectives

var missions = {
    'prepare_for_small_celebration' : {
        'description' : 'Przygotuj się do małego święta',
        'objectives'  : [objectives['gather_5_meat'], objectives['gather_5_wheat']],
        'fail'        : {
            'msg' : 'Sukces'
        },
        'success'     : {
            'msg' : 'Porażka'
        }
    },
    'prepare_for_medium_celebration' : {
        'description' : 'Przygotuj się do średniego święta',
        'objectives'  : [objectives['gather_10_meat'], objectives['gather_10_wheat']],
        'fail'        : {
            'msg' : 'Sukces'
        },
        'success'     : {
            'msg' : 'Porażka'
        }
    },
    'prepare_for_medium_celebration' : {
        'description' : 'Przygotuj się do dużego święta',
        'objectives'  : [objectives['gather_20_meat'], objectives['gather_20_wheat']],
        'fail'        : {
            'msg' : 'Sukces'
        },
        'success'     : {
            'msg' : 'Porażka'
        }
    },

}