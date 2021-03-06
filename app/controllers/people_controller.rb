class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  before_action :in_redirect

  # GET /people
  # GET /people.json
  def index
    @people = Person.all.select { |p| p.subscriptions.where(year:@year).any? ||  p.subscriptions.count == 0 }.sort_by { |p| p.cognome }
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, success: "Anagrafica di #{@person.nome} #{@person.cognome} creata correttamente." }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, success: 'Anagrafica modificata correttamente.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, success: 'Anagrafica eliminata correttamente.' }
      format.json { head :no_content }
    end
  end

  def search
    @people = Person.where('LOWER(nome) LIKE ? OR LOWER(cognome) LIKE ?', params[:nome].downcase, params[:cognome].downcase)
    if @people.any?
      render 'index'
    else
      flash[:error] = 'Nessuna anagrafica trovata'
      redirect_to root_path
    end
  end

  def assegnare
    @people = Person.where(group: nil)
    if @people.any?
      render 'index'
    else
      flash[:error] = "L'assegnazione è stata già completata, nessuna persona senza gruppo."
      redirect_to root_path
    end
  end

  def printed
    @people = Person.all.select { |p| p.subscriptions.where(year:@year).any? }.sort_by { |p| p.cognome}
  end

  def printedgroup
    @group = Group.find_by(id: params[:id])
    if @group
      @people = Person.where(group: @group).select { |p| p.subscriptions.where(year:@year).any? }.sort_by { |p| p.cognome}
      render 'printed'
    else
      flash[:error] = 'Nessun gruppo con questo id'
      redirect_to root_path
    end
  end

  def printpergroup
    @pergroup = Person.all.group_by do |p|
      if p.group.nil?
        "Senza gruppo assegnato"
      else
        p.group.nome
      end
    end
    @pergroup.sort_by do |p, v|
      if Group.find_by(nome: p)
         Group.find_by(nome: p).anno
      else
        0
      end
    end
    @pergroup.map do |p, v|
      v.sort_by { |a| a.cognome }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:nome, :cognome, :battesimo, :parrocchia, :data_di_nascita, :luogo_di_nascita, :padre, :madre, :telefono, :cellulare, :indirizzo, :comune, :cap, :group_id, :scuola, :note, :iscrivente, :battesimosconosciuto)
    end
end
