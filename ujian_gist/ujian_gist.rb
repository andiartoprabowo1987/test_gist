#main logic in ruby should create here
class UjianNew < SitePrism::Page
path = ‘/home’
set_url(path)
element :TXT_LOGIN_EMAIL:'#login_field',
element :TXT_LOGIN_PASS:'#password',
element :BTN_SUBMIT_LOGIN:'#login > form > div.auth-form-body.mt-3 >
input.btn.btn-primary.btn-block',
element :TXT_GIST_DESC:'#gists > input',
element :TXT_GIST_FILENAME:'#gists > div.js-gist-file > div > div.file-header.mb-2 >
div.input-element group.gist- filename-input > input.form-control.filename.js-gistfilename.js-blob-filename',
element :TXT_GIST_CODE:'.commit-create > .form-control',
element :BTN_CREATE_PUBLIC_GIST:'#new_gist > div > div.form-actions >
button:nth-child(1)',
element :LBL_MY_GIST:'.file-info',
element :BTN_EDIT_GIST:'#gist-pjax-container >
div.gisthead.pagehead.repohead.instapaper_ignore.readability-menu.experimentrepo-nav.pt-3.mb-4 > div > div.mb-3.d-flex > ul > li:nth-child(1) > a',
element :BTN_SUBMIT_EDIT_GIST:'.btn-primary',
element :BTN_DELETE_GIST:'.pagehead-actions > :nth-child(2) > form > .btn',
element :BTN_PROFILE:'#user-links > details > summary',
element :BTN_VIEW_MY_GISTS:'#user-links > details > details-menu > a:nthchild(3)',
element :BTN_LIST_MY_GISTS:'#gist-pjax-container > div > div.gutter.d-flex >
div.col-9 > div.pagehead.py-0 > nav > a',
element :LBL_BLANK_LIST_GIST:'#gist-pjax-container > div > div.gutter.d-flex >
div.col-9 > div.blankslate',
element :LBL_GIST_SNIPPET:'#gist-pjax-container > div > div.gutter.d-flex >
div.col-9 > div.gist-snippet'
def page_home
 if page.has_css?(’#gists > input’)
 page.should have value(’trial gist test’)
 else
 page.should have_xpath('#gists > input')
 end
end