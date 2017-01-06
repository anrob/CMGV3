ActiveAdmin.register_page "Dashboard" do
  

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        #span I18n.t("active_admin.dashboard_welcome.welcome")
        #small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end
 
   columns do 
      column do 
        panel "Recently Booked Jobs" do 
          table_for Contract.order("created_at desc").limit(25) do 
      column "Created at", :created_at
      column "Contract Price", :contract_price
      column "Act Booked", :act_booked
      column "Booking Agent", :agent
      column "Contract Status", :contract_status
      
        end
        para "Total Dollars Book this Month"
        para Contract.thirtyday.sum(:contract_price)
        para Contract.thismonth.sum(:contract_price)
        para Contract.thismonth.count
        
      end
    end
  end
    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

      columns do
      #  panel "Info" do
         # para "Welcome to ActiveAdmin. Very Cool"
        end
      end
    # end
  end # content

