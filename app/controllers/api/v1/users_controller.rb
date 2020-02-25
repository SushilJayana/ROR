module Api
  module V1        
    class UsersController < ApplicationController
      def index
        users= User.order('created_at DESC')
        render json: {status:'SUCCESS', message:"Loaded users", payload: users}, status: :ok                                
      end

      def show
        user = User.find(params[:id])
        render json: {status:'SUCCESS', message:"Loaded user", payload: user}, status: :ok                                
      end

      def create
          user = User.new(user_params)

          if user.save
              render json: {status:'SUCCESS', message:"Saved users", payload: user}, status: :ok
          else
              render json: {status:'ERROR', message:"Users not Saved users", payload: user.errors}, status: :unprocessable_entity    
          end                                
      end

      private def user_params
          params.permit(:name, :phone)                
      end

      def destroy
        user = User.find(params[:id])
        user.destroy
        render json: {status:'SUCCESS', message:"Deleted user", payload: user}, status: :ok
      end
      
      def update
        user = User.find(params[:id])

        if user.update_attributes(user_params)
          render json: {status:'SUCCESS', message:"Updated user", payload: user}, status: :ok
        else
          render json: {status:'ERROR', message:"Users not updated", payload: user.errors}, status: :unprocessable_entity
        end
      end

    end 
  end  
end
