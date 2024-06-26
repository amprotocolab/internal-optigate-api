module Mutations
  module SystemNotifications
    class CreateSystemNotifications < BaseMutation
      argument :title, String, required: true
      argument :content, String, required: true

      field :system_notification, Types::SystemNotificationType, null: true

      def resolve(title:, content:)
        system_notification = SystemNotification.new(title: title, content: content)

        if system_notification.save
          OneSignalService.send_notification(title, content) 
          { system_notification: system_notification, errors: [] }
        else
          { system_notification: nil, errors: system_notification.errors.full_messages }
        end
      end
    end
  end
end

