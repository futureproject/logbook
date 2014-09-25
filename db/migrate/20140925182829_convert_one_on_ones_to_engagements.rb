class ConvertOneOnOnesToEngagements < ActiveRecord::Migration
  def up
    OneOnOne.all.each do |o|
      puts o.person.present?
      if o.person.present?
        e = Engagement.create!(
          kind: 'Coaching Session',
          date: o.date,
          duration: o.duration,
          attendee_ids: [o.person_id],
          notes: o.note
        )
      end
    end
  end

  def down
  end
end
