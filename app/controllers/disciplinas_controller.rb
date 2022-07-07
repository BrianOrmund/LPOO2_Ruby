# Esta é a classe para o controller disciplinas
#
# Cada método dessa classe implementa uma ação do CRUD
# (ou algum suporte a ela).
#
# - index: lista os disciplinas (R)
# - show: exibe um disciplina (R)
# - new: instancia um novo disciplina (C)
# - create: cria o disciplina instanciado no model (C)
# - edit: exibe o form para editar um disciplina (U)
# - update: atualiza o disciplina no model (U)
# - destroy: deleta um disciplina no model (D)

class DisciplinasController < ApplicationController

    def index
        @disciplinas = Disciplina.all
    end

    def show
        @disciplina = Disciplina.find(params[:id])
    end

    def new
        @disciplina = Disciplina.new
    end

    def create
        @disciplina = Disciplina.new(nome: params[:disciplina][:nome], ementa: params[:disciplina][:ementa])

        if @disciplina.save
            redirect_to @disciplina
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @disciplina = Disciplina.find(params[:id])
    end

    def update
        @disciplina = Disciplina.find(params[:id])

        if @disciplina.update(nome: params[:disciplina][:nome], ementa: params[:disciplina][:ementa])
            redirect_to @disciplina
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @disciplina = Disciplina.find(params[:id])
        @disciplina.destroy
    
        redirect_to root_path, status: :see_other
    end
end
