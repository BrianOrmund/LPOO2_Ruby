# Esta é a classe para o controller Alunos
#
# Cada método dessa classe implementa uma ação do CRUD
# (ou algum suporte a ela).
#
# - index: lista os Alunos (R)
# - show: exibe um Aluno (R)
# - new: instancia um novo Aluno (C)
# - create: cria o Aluno instanciado no model (C)
# - edit: exibe o form para editar um Aluno (U)
# - update: atualiza o Aluno no model (U)
# - destroy: deleta um Aluno no model (D)

class AlunosController < ApplicationController

    def index
        @alunos = Aluno.all
    end

    def show
        @aluno = Aluno.find(params[:id])
    end

    def new
        @aluno = Aluno.new
    end

    def create
        @aluno = Aluno.new(nome: params[:aluno][:nome], email: params[:aluno][:email])

        if @aluno.save
            redirect_to @aluno
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @aluno = Aluno.find(params[:id])
    end

    def update
        @aluno = Aluno.find(params[:id])

        if @aluno.update(nome: params[:aluno][:nome], email: params[:aluno][:email])
            redirect_to @aluno
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @aluno = Aluno.find(params[:id])
        @aluno.destroy
    
        redirect_to root_path, status: :see_other
    end
end
