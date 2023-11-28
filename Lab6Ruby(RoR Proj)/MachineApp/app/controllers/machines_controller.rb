class MachinesController < ApplicationController
    before_action :set_machine, only: %i[show edit update destroy]
  
    def index
      @machines = Machine.all
      @total_downtime = Machine.sum(:downtime)
      @machines_without_downtime = Machine.where(downtime: 0)
      @relative_downtime_all = Machine.all.map { |machine| [machine.name, (machine.downtime.to_f / machine.uptime) * 100] }.to_h
    end
  
    def show; end
  
    def new
      @machine = Machine.new
    end
  
    def create
      @machine = Machine.new(machine_params)
      if @machine.save
        redirect_to machines_path, notice: 'Machine was successfully created.'
      else
        render :new
      end
    end
  
    def edit; end
  
    def update
      if @machine.update(machine_params)
        redirect_to machines_path, notice: 'Machine was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @machine.destroy
      redirect_to machines_url, notice: 'Machine was successfully destroyed.'
    end
  
    private
  
    def set_machine
      @machine = Machine.find(params[:id])
    end
  
    def machine_params
      params.require(:machine).permit(:name, :downtime, :uptime)
    end
  end
  