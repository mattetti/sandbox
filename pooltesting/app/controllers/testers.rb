class Testers < Application
  # provides :xml, :yaml, :js

  def index
    @testers = Tester.all
    display @testers
  end

  def show
    @tester = Tester.get(params[:id])
    raise NotFound unless @tester
    display @tester
  end

  def new
    only_provides :html
    @tester = Tester.new
    render
  end

  def edit
    only_provides :html
    @tester = Tester.get(params[:id])
    raise NotFound unless @tester
    render
  end

  def create
    @tester = Tester.new(params[:tester])
    if @tester.save
      redirect url(:tester, @tester)
    else
      render :new
    end
  end

  def update
    @tester = Tester.get(params[:id])
    raise NotFound unless @tester
    if @tester.update_attributes(params[:tester]) || !@tester.dirty?
      redirect url(:tester, @tester)
    else
      raise BadRequest
    end
  end

  def destroy
    @tester = Tester.get(params[:id])
    raise NotFound unless @tester
    if @tester.destroy
      redirect url(:tester)
    else
      raise BadRequest
    end
  end

end # Testers
