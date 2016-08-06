var current_day
var days = preload('calendar/days.gd').new()
var missions = preload('missions/missions.gd').new()
var bag

func _init():
    self.current_day = 1

func _init_bag(bag):
    self.bag = bag

func next_day():
    self.current_day = self.current_day + 1
    if self.days.days.has(self.current_day):
        return self.days.days[self.current_day]

    return self.days.ordinary_day

func handle_event(event):
    if not event.mission == '':
        var mission = self.missions.missions[event.mission]
        var quantity
        #check resources
        for objective in mission['objectives']:
            for resource in  objective['use'].keys():
                quantity = objective['use'][resource]
                if not self.bag.resources.has(resource, quantity):
                    return false
        for objective in mission['objectives']:
            for resource in  objective['use'].keys():
                quantity = objective['use'][resource]
                self.bag.resources.use(resource, quantity)

        return true

func get_next_event():
    var event_days = self.days.days.keys()
    var day_of_year = self.current_day % 356
    event_days.sort()
    for day in event_days:
        if day > day_of_year:
            return self.days.days[day]

    return self.days.days[1]


