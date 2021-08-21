class Appointment
    attr_reader :location, :purpose, :hour, :min
    def initialize(location,purpose,hour,min)
      @location = location
      @purpose = purpose
      @hour = hour
      @min = min
    end
end

Appointment.new('santiago','clases sesion',19,0)

class MonthlyAppointment < Appointment
    attr_reader :day
    def initialize(location,purpose,hour,min,day)
        super(location,purpose,hour,min)
        @day = day
    end 

    def to_s
        # Reunión mensual en NASA sobre Aliens el día 23 a la(s) 8:15.
        "Reunión mensual en #{@location} Sobre #{@purpose} el día #{@day} a la(s) #{@hour}:#{@min}"
    end

    def occurs_on?(day)
        @day == day
    end
end

puts MonthlyAppointment.new('NASA','Aliens',8,15,23)

class DailyAppointment < Appointment

    def occurs_on?(hour,min)
        @hour == hour
        @min == min
    end

    def to_s
        # Reunión diaria en Desafío Latam sobre Educación a la(s) 8:15
        "Reunión diaria en #{@location} sobre #{@purpose} a la(s) #{@hour}:#{@min}"
    end
end

puts DailyAppointment.new('Desafío Latam', 'Educación', 8, 15)


class OneTimeAppointment < Appointment
    attr_reader :day, :month, :year
    def initialize(location,purpose,hour,min,day,month,year)
        super(location,purpose,hour,min)
        @day = day
        @month = month
        @year = year
    end

    def occurs_on?(day,month,year)
        @day == day
        @month == month
        @year == year
    end

    def to_s
        # Reunión única en Desafío Latam sobre Trabajo el 4/6/2019 a la(s) 14:30.
        "Reunión única en #{@location} sobre #{@purpose} el #{@day}/#{@month}/#{@year} a la(s) #{@hour}:#{@min}"
    end
end

puts OneTimeAppointment.new('Desafío Latam', 'Trabajo', 14, 30, 4, 6, 2019)