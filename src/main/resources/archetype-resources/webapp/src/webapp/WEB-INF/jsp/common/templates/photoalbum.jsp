<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="iso-8859-1" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/aksess" prefix="aksess" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/photo" prefix="photo" %>
<%@ taglib uri="http://www.kantega.no/aksess/tags/commons" prefix="kantega" %>

<kantega:section id="title">
    <aksess:getattribute name="title"/>
</kantega:section>

<kantega:section id="bodyclass">photoalbum</kantega:section>

<kantega:section id="head">
    <script type="text/javascript" src="<aksess:geturl url="/js/common/history.js"/>"></script>
    <script type="text/javascript" src="<aksess:geturl url="/js/common/gallerific.js"/>"></script>
    <script type="text/javascript" src="<aksess:geturl url="/js/common/opacity-rollover.js"/>"></script>
    <%-- We only want the thunbnails to display when javascript is disabled --%>
    <script type="text/javascript">
        document.write('<style>.noscript { display: none; }</style>');
    </script>
</kantega:section>

mvn archetype:generate -DarchetypeGroupId=org.kantega.archetypes -DarchetypeArtifactId=openaksess-project -DarchetypeVersion=1.6 -DarchetypeRepository=http://opensource.kantega.no/nexus/content/groups/public/

<kantega:section id="content">
    <h1><aksess:getattribute name="title"/></h1>

    <aksess:exists name="lead paragraph">
        <p class="leadParagraph">
            <aksess:getattribute name="lead paragraph"/>
        </p>
    </aksess:exists>

    <aksess:setvariable name="photoalbum" attribute="mediafolder"/>
    <div class="image">
        <photo:image url="/multimedia.ap" width="400" height="300"/>
        <div class="copyright">
            <kantega:label key="photoalbum.picture" bundle="site"/> <photo:image property="offset"/> <kantega:label key="photoalbum.of" bundle="site"/> <photo:image property="total"/> &copy; <photo:image property="author" defaultvalue=""/>
        </div>
        <div class="title">
            <photo:image property="title"/>
        </div>
        <div class="caption">
            <photo:image property="description"/>
        </div>
    </div>

    <div class="navigation">
        <photo:navigate cssclass="forrige" offset="-1">&lsaquo; <kantega:label key="photoalbum.previous" bundle="site"/></photo:navigate>
        <photo:navigate cssclass="neste" offset="1"><kantega:label key="photoalbum.next" bundle="site"/> &rsaquo;</photo:navigate>
    </div>

    <div class="index">
        <table>
            <tr>
                <td class="previous">
                    <photo:navigate offset="-1">
                        <img src="<aksess:geturl url="/bitmaps/common/img_link_left.gif"/>" alt="<kantega:label key="photoalbum.group.previous" bundle="site" />">
                    </photo:navigate>
                </td>
                <photo:index width="200" height="85" max="4" cssclass="bildealbumBilde" selectedcssclass="bildealbumBildeValgt" space="4" />
                <td class="next">
                    <photo:navigate offset="1">
                        <img src="<aksess:geturl url="/bitmaps/common/img_link_right.gif"/>" alt="<kantega:label key="photoalbum.group.next" bundle="site" />">
                    </photo:navigate>
                </td>
            </tr>
        </table>
    </div>

    <script type="text/javascript">
        jQuery(document).ready(function($) {
            // We only want these styles applied when javascript is enabled
            $('div.content').css('display', 'block');

            // Initially set opacity on thumbs and add
            // additional styling for hover effect on thumbs
            var onMouseOutOpacity = 0.67;
            $('#thumbs ul.thumbs li, div.navigation a.pageLink').opacityrollover({
                mouseOutOpacity:   onMouseOutOpacity,
                mouseOverOpacity:  1.0,
                fadeSpeed:         'fast',
                exemptionSelector: '.selected'
            });

            // Initialize Advanced Galleriffic Gallery
            var gallery = $('#thumbs').galleriffic({
                delay:                     2500,
                numThumbs:                 10,
                preloadAhead:              10,
                enableTopPager:            false,
                enableBottomPager:         false,
                imageContainerSel:         '#slideshow',
                controlsContainerSel:      '#controls',
                captionContainerSel:       '#caption',
                loadingContainerSel:       '#loading',
                renderSSControls:          true,
                renderNavControls:         true,
                playLinkText:              '<kantega:label key="photoalbum.gallerific.slideshow.play" bundle="site"></kantega:label>',
                pauseLinkText:             '<kantega:label key="photoalbum.gallerific.slideshow.stop" bundle="site"></kantega:label>',
                prevLinkText:              '&lsaquo; <kantega:label key="photoalbum.gallerific.photo.previous" bundle="site"></kantega:label>',
                nextLinkText:              '<kantega:label key="photoalbum.gallerific.photo.next" bundle="site"></kantega:label> &rsaquo;',
                nextPageLinkText:          '<kantega:label key="photoalbum.gallerific.group.next" bundle="site"></kantega:label> &rsaquo;',
                prevPageLinkText:          '&lsaquo; <kantega:label key="photoalbum.gallerific.group.previous" bundle="site"></kantega:label>',
                enableHistory:             true,
                autoStart:                 false,
                syncTransitions:           true,
                defaultTransitionDuration: 900,
                onSlideChange:             function(prevIndex, nextIndex) {
                    // 'this' refers to the gallery, which is an extension of $('#thumbs')
                    this.find('ul.thumbs').children()
                        .eq(prevIndex).fadeTo('fast', onMouseOutOpacity).end()
                        .eq(nextIndex).fadeTo('fast', 1.0);

                    // Update the photo index display
                    this.$captionContainer.find('div.photo-index')
                        .html('Photo '+ (nextIndex+1) +' of '+ this.data.length);
                },
                onPageTransitionOut:       function(callback) {
                    this.fadeTo('fast', 0.0, callback);
                },
                onPageTransitionIn:        function() {
                    var prevPageLink = this.find('a.prev').css('visibility', 'hidden');
                    var nextPageLink = this.find('a.next').css('visibility', 'hidden');

                    // Show appropriate next / prev page links
                    if (this.displayedPage > 0)
                        prevPageLink.css('visibility', 'visible');

                    var lastPage = this.getNumPages() - 1;
                    if (this.displayedPage < lastPage)
                        nextPageLink.css('visibility', 'visible');

                    this.fadeTo('fast', 1.0);
                }
            });

            /**************** Event handlers for custom next / prev page links **********************/

            gallery.find('a.prev').click(function(e) {
                gallery.previousPage();
                e.preventDefault();
            });

            gallery.find('a.next').click(function(e) {
                gallery.nextPage();
                e.preventDefault();
            });

            /****************************************************************************************/

            /**** Functions to support integration of galleriffic with the jquery.history plugin ****/

            // PageLoad function
            // This function is called when:
            // 1. after calling $.historyInit();
            // 2. after calling $.historyLoad();
            // 3. after pushing "Go Back" button of a browser
            function pageload(hash) {
                // alert("pageload: " + hash);
                // hash doesn't contain the first # character.
                if(hash) {
                    $.galleriffic.gotoImage(hash);
                } else {
                    gallery.gotoIndex(0);
                }
            }

            // Initialize history plugin.
            // The callback is called at once by present location.hash.
            $.historyInit(pageload, "<aksess:geturl/>");

            // set onlick event for buttons using the jQuery 1.3 live method
            $("a[rel='history']").live('click', function(e) {
                if (e.button != 0) return true;

                var hash = this.href;
                hash = hash.replace(/^.*#/, '');

                // moves to a new page.
                // pageload is called at once.
                // hash don't contain "#", "?"
                $.historyLoad(hash);

                return false;
            });

            /****************************************************************************************/
        });
    </script>  
</kantega:section>

<aksess:include url="/WEB-INF/jsp$SITE/include/design/standard.jsp"/>
