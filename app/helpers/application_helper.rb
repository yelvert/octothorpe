module ApplicationHelper
  def logged_in?
    session[:user_id] ? true : false
  end
  
  def google_analytics(account_number)
    %Q[
      <script type="text/javascript" charset="utf-8">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', '#{account_number}']);
        _gaq.push(['_trackPageview']);
        (function() {
          var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
          ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
          var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
      </script>
    ]
  end
end
