class FactoryController < ApplicationController
    def index
      @factory = Factory.new
      @machine1 = Machine.new("Lathe", 20, 500)
      @machine2 = Machine.new("Press", 10, 600)
      @machine3 = Machine.new("Cutter", 0, 600)
      @machine4 = Machine.new("Welder", 15, 550)
      @factory.machines << @machine1 << @machine2 << @machine3 << @machine4
    end
  end  