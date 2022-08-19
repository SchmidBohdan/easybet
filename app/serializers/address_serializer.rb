# frozen_string_literal: true

class AddressSerializer < BaseSerializer

  attributes :comment,
             :essential_scoreboard,
             :essential_scoreboard_callback,
             :stats,
             :timeline,
             :overview_comment

end
