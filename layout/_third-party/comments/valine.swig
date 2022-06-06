{%- set valine_uri = theme.vendors.xiaojiji or '//unpkg.com/xiaojiji@0.1.7/dist/Valine.min.js' %}

<script>
NexT.utils.loadComments(document.querySelector('#valine-comments'), () => {
  NexT.utils.getScript('{{ valine_uri }}', () => {
    var GUEST = ['nick', 'mail', 'link'];
    var guest = '{{ theme.xiaojiji.guest_info }}';
    guest = guest.split(',').filter(item => {
      return GUEST.includes(item);
    });
    new Valine({
      el         : '#valine-comments',
      verify     : {{ theme.xiaojiji.verify }},
      notify     : {{ theme.xiaojiji.notify }},
      appId      : '{{ theme.xiaojiji.appid }}',
      appKey     : '{{ theme.xiaojiji.appkey }}',
      placeholder: {{ theme.xiaojiji.placeholder | json }},
      avatar     : '{{ theme.xiaojiji.avatar }}',
      meta       : guest,
      pageSize   : '{{ theme.xiaojiji.pageSize }}' || 10,
      visitor    : {{ theme.xiaojiji.visitor }},
      lang       : '{{ theme.xiaojiji.language }}' || 'zh-cn',
      path       : location.pathname,
      recordIP   : {{ theme.xiaojiji.recordIP }},
      serverURLs : '{{ theme.xiaojiji.serverURLs }}'
    });
  }, window.Valine);
});
</script>
