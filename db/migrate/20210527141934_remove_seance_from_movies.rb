class RemoveSeanceFromMovies < ActiveRecord::Migration[6.1]
  def change
    remove_reference :movies, :seance, null: false, foreign_key: true
  end
end
