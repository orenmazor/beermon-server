module KegsHelper
  def add_draggable(keg)
    'draggable' if keg.remaining > 1
  end
end
