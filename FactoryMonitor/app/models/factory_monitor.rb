class Machine
    attr_accessor :name, :downtime, :uptime
  
    def initialize(name, downtime, uptime)
      @name = name
      @downtime = downtime
      @uptime = uptime
    end
  end
  
  class Factory
    attr_accessor :machines
  
    def initialize
      @machines = []
    end
  
    def total_downtime
      @machines.map(&:downtime).reduce(0, :+)
    end
  
    def machines_without_downtime
      @machines.select { |machine| machine.downtime == 0 }
    end
  
    def relative_downtime(machine)
      (machine.downtime.to_f / machine.uptime) * 100
    end
  
    def relative_downtime_all
      @machines.map { |machine| [machine.name, relative_downtime(machine)] }.to_h
    end
  end
  
  machine1 = Machine.new("Press", 20, 500)
  machine2 = Machine.new("Press2", 10, 600)
  machine3 = Machine.new("Cutter", 0, 600)
  machine4 = Machine.new("Welder", 15, 550)
  
  factory = Factory.new
  
  factory.machines << machine1 << machine2 << machine3 << machine4
  
  puts "Total downtime: #{factory.total_downtime} hours"
  puts "Machines without downtime: #{factory.machines_without_downtime.map(&:name)}"
  puts "Relative downtime for each machine: #{factory.relative_downtime_all}"