function checkParent(element, classNames) {
while (element) {
if (element.classList && classNames.some(cn => element.classList.contains(cn))) {
return true;
}
element = element.parentElement;
}
return false;
}
var excludedClasses = ['talks_comments','tiaozhuan-button']; // 添加需要排除的a标签类名class
window.addEventListener('load', (event) => {
document.body.addEventListener('click', function(e) {
let target = e.target;
while (target && target.nodeName !== 'A') {
target = target.parentNode;
}
if (target && target.nodeName === 'A' &&
!checkParent(target, excludedClasses) &&
!target.href.includes('blog.taoshuge.eu.org') &&
!target.href.includes('book.catpdf.org') &&
!target.href.includes('railway.app') &&
!target.href.includes('cloudflare.com') &&
!target.href.includes('gohugo.io') &&
!target.href.includes('vercel.com') &&
!target.href.includes('umami.is') &&
!target.href.includes('aliyundrive.com') &&
!target.href.includes('youtube.com') &&
!target.href.includes('chatgpt.com') &&
!target.href.includes('x.com') &&
!target.href.includes('moonshot.cn') &&
!target.href.includes('baidu.com') &&
!target.href.includes('csdn.net') &&
!target.href.includes('gitee.com') &&
!target.href.includes('51.la') &&
!target.href.includes('supabase.com') &&
!target.href.includes('123pan.com') &&
!target.href.includes('huggingface.co') &&
!target.href.includes('ollama.com') &&
!target.href.includes('99bilibili.eu.org') &&
!target.href.includes('indiehackertools.net') &&
!target.href.includes('douban.com') &&
!target.href.includes('discord.com') &&
!target.href.includes('coze.com') &&
!target.href.includes('bilibili.com') &&
!target.href.includes('talimus.eu.org') &&
!target.href.includes('github.com') &&
!target.href.includes('chat.leshans.eu.org') &&
!target.href.includes('remove.bg') &&
!target.href.includes('perplexity.ai') &&
!target.href.includes('pexels.com') &&
!target.href.includes('squoosh.app') &&
target.hostname !== window.location.hostname) {
e.preventDefault();
let encodedUrl = btoa(target.href); // Base64 encode the URL
let url = '/tiaozhuan?target=' + encodedUrl;
window.open(url, '_blank');
}
});
});