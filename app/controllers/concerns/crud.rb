module Crud
  extend ActiveSupport::Concern

  def create_crud(model, redirect_path)
    model.user = current_user
    respond_to do |format|
      if model.save
        path = redirect_path
        if block_given?
          options = yield(model)
          if options.is_a?(Hash)
            path = options[:redirect_path] if options[:redirect_path].present?
          end
        end

        format.html { redirect_to path, notice: "#{class_name(model)} criado(a) com sucesso." }
        format.json { render :show, status: :created, location: model }
      else
        format.html { redirect_to redirect_path, error: "Erro ao criar novo(a) #{class_name(model)}." }
        format.json { render json: model.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_crud(model, model_params, redirect_path)
    respond_to do |format|
      if model.update(model_params)
        path = redirect_path
        if block_given?
          options = yield(model)
          if options.is_a?(Hash)
            path = options[:redirect_path] if options[:redirect_path].present?
          end
        end

        format.html { redirect_to path, notice: "#{class_name(model)} atualizado(a) com sucesso." }
        format.json { render :show, status: :ok, location: model }
      else
        format.html { redirect_to redirect_path, error: "Erro ao atualizar #{class_name(model)}."  }
        format.json { render json: model.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy_crud(model, redirect_path)
    model.destroy
    respond_to do |format|
      format.html { redirect_to redirect_path, notice: "#{class_name(model)} excluído(a) com sucesso." }
      format.json { head :no_content }
    end
  end

  private

  def class_name(model)
    model.model_name.human
  end
end