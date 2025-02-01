# app/models/concerns/notable.rb
module Notable
  extend ActiveSupport::Concern

  included do
    has_many :notes, as: :notable, dependent: :destroy
  end

  # Optional helper method to add a comment or system note
  def add_note(note_type:, content:, user: nil)
    notes.create!(
      note_type: note_type,
      content: content,
      user: user
    )
  end
end
