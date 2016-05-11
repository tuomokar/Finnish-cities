Tabulous.setup do

  tabs do

    home_tab do
      text          { t :Home }
      link_path     { root_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('home') }
    end

    regions_tab do
      text          { t :Regions }
      link_path     { regions_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('regions') }
    end

    municipalities_tab do
      text          { t :Municipalities }
      link_path     { municipalities_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('municipalities') }
    end

    users_tab do
      text          { t :Users }
      link_path     { users_path }
      visible_when  { true }
      enabled_when  { true }
      active_when do
        in_action('index').of_controller('users')
        in_action('edit').of_controller('users')
      end
    end

    places_tab do
      text          { t :Places }
      link_path     { places_path }
      visible_when  { true }
      enabled_when  { true }
      active_when   { in_action('any').of_controller('restaurants') }
    end

    # user related functions -->
    registering_tab do
      text          { t :signin }
      link_path     { signin_path }
      visible_when  { current_user.nil? }
      enabled_when  { true }
      active_when   { in_action('new').of_controller('sessions') }
    end

    login_tab do
      text          { t :signup }
      link_path     { signup_path }
      visible_when  { current_user.nil? }
      enabled_when  { true }
      active_when   { in_action('new').of_controller('users') }
    end

    user_tab do
      text          { current_user.username }
      http_verb     { :delete }
      link_path     { user_path(:locale, current_user.id) }
      visible_when  { current_user }
      enabled_when  { true }
      active_when   { a_subtab_is_active }
    end

    my_page_subtab do
      text          { t :my_page }
      link_path     { user_path(current_user.id) }
      visible_when  { current_user }
      enabled_when  { true }
      active_when   { in_action('show').of_controller('users')}
    end

    logout_subtab do
      text          { t :signout }
      http_verb     { :delete }
      link_path     { signout_path }
      visible_when  { current_user }
      enabled_when  { true }
      active_when   { in_action('destroy').of_controller('sessions') }
    end
    # <-- user functions

    # -- language -->
    language_english_tab do
      text          { 'fi' }
      link_path     { url_for( locale: :fi ) }
      visible_when  { I18n.locale == :en }
      enabled_when  { true }
      active_when   { false }
    end

    language_finnish_tab do
      text          { 'en' }
      link_path     { url_for( locale: :en ) }
      visible_when  { I18n.locale == :fi }
      enabled_when  { true }
      active_when   { false }
    end
  # <-- language

  end

  customize do

    # which class to use to generate HTML
    # :default, :html5, :bootstrap, :bootstrap_pill or :bootstrap_navbar
    # or create your own renderer class and reference it here
    renderer :bootstrap_navbar


    # whether to allow the active tab to be clicked
    # defaults to true
    # active_tab_clickable true

    # what to do when there is no active tab for the current controller action
    # :render -- draw the tabset, even though no tab is active
    # :do_not_render -- do not draw the tabset
    # :raise_error -- raise an error
    # defaults to :do_not_render
    # when_action_has_no_tab :do_not_render

    # whether to always add the HTML markup for subtabs, even if empty
    # defaults to false
    # render_subtabs_when_empty false

  end

  # The following will insert some CSS straight into your HTML so that you
  # can quickly prototype an app with halfway-decent looking tabs.
  #
  # This scaffolding should be turned off and replaced by your own custom
  # CSS before using tabulous in production.
  use_css_scaffolding do
    background_color '#ccc'
    text_color '#444'
    active_tab_color '#fff'
    hover_tab_color '#ddd'
    inactive_tab_color '#aaa'
    inactive_text_color '#888'
  end

end
