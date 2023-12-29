class KittensController < ApplicationController
    # Before executing certain actions, set the kitten instance variable
    # This helps avoid repeating code for actions that require a specific kitten    
    before_action :set_kitten, only: [:show, :edit, :update, :destroy]

    # Display a list of all kittens
    def index
        @kittens = Kitten.all 
    end

    # Display details for a specific kitten
    def show
    end

    # Render a form for creating a new kitten
    def new
        @kitten = Kitten.new
    end

    # Create a new kitten based on the form submission
    def create
        @kitten = Kitten.new(kitten_params)

        if @kitten.save
            redirect_to @kitten, notice: 'Kitten was successfully created.'
        else
            render :new
        end
    end

    # Render a form for editing a specific kitten
    def edit
    end

    # Update a specific kitten based on the form submission
    def update
        if @kitten.update(kitten_params)
            redirect_to @kitten, notice: 'Kitten was successfully updated.'
        else
            # If the update fails, render the edit form again
            render :edit
        end
    end

    # Delete a specific kitten
    def destroy
        @kitten.destroy
        redirect_to root_path
    end

    private

    # Find the specific kitten based on the ID parameter
    def set_kitten
        @kitten = Kitten.find(params[:id])
    end

    # Define the allowed parameters for creating or updating a kitten
    def kitten_params
        params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
end