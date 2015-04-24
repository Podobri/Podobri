<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url var="imgURL" value="resources/images/" />
<html>
<jsp:include page="layout/head.jsp" />
<body>
  <div class="container">
    <jsp:include page="layout/menu.jsp" />
    <div id="content">
      <div id="about" class="col-md-12">
        <div class="row">
          <div id="about-picture">
            <img alt="about" src="${imgURL}/aboutUs.png" />
          </div>
        </div>
        <div class="row">
          <div id="about-menu" class="menu-tabs">
            <ul class="nav nav-tabs">
              <li class="active"><a data-toggle="tab" href="#idea"><spring:message code="aboutMenuIdea" /></a></li>
              <li><a data-toggle="tab" href="#values"><spring:message code="aboutMenuValues" /></a></li>
              <li><a data-toggle="tab" href="#how-we-work"><spring:message code="aboutMenuHowWeWork" /></a></li>
              <li><a data-toggle="tab" href="#team"><spring:message code="aboutMenuOurTeam" /></a></li>
            </ul>
          </div>
        </div>
        <div class="row">
          <div id="about-content" class="tab-content col-md-10 col-md-offset-1">
            <div id="idea" class="tab-pane fade in active">
              <h3>
                <spring:message code="aboutIdeaTitle" />
              </h3>
              <hr />
              <p>This is some sample text. This is some sample text.This is some sample text. This is some sample text. This
                is some sample text. This is some sample text.This is some sample text. This is some sample text. This is some
                sample text. This is some sample text.This is some sample text. This is some sample text. This is some sample
                text. This is some sample text.</p>
              <div class="video">
                <div class="container">
                  <div class="row">
                    <div class="embed-responsive embed-responsive-16by9 col-md-12">
                      <iframe class="embed-responsive-item" src="//www.youtube.com/embed/1UUYjd2rjsE"></iframe>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div id="values" class="tab-pane fade">
              <h3>
                <spring:message code="aboutValuesTitle" />
              </h3>
              <hr />
              <p>This is some sample text. This is some sample text.This is some sample text. This is some sample text. This
                is some sample text. This is some sample text.This is some sample text. This is some sample text. This is some
                sample text. This is some sample text.This is some sample text. This is some sample text. This is some sample
                text. This is some sample text. This is some sample text. This is some sample text.This is some sample text. This
                is some sample text. This is some sample text. This is some sample text.This is some sample text. This is some
                sample text. This is some sample text. This is some sample text.This is some sample text. This is some sample
                text. This is some sample text. This is some sample text. This is some sample text. This is some sample text.This
                is some sample text. This is some sample text. This is some sample text. This is some sample text.This is some
                sample text. This is some sample text. This is some sample text. This is some sample text.This is some sample
                text. This is some sample text. This is some sample text. This is some sample text.</p>
            </div>
            <div id="how-we-work" class="tab-pane fade">
              <h3>
                <spring:message code="aboutHowWeWorkTitle" />
              </h3>
              <hr />
              <p>This is some sample text. This is some sample text.This is some sample text. This is some sample text. This
                is some sample text. This is some sample text.This is some sample text. This is some sample text. This is some
                sample text. This is some sample text.This is some sample text. This is some sample text. This is some sample
                text. This is some sample text. This is some sample text. This is some sample text.This is some sample text. This
                is some sample text. This is some sample text. This is some sample text.This is some sample text. This is some
                sample text. This is some sample text. This is some sample text.This is some sample text. This is some sample
                text. This is some sample text. This is some sample text. This is some sample text. This is some sample text.This
                is some sample text. This is some sample text. This is some sample text. This is some sample text.This is some
                sample text. This is some sample text. This is some sample text. This is some sample text.This is some sample
                text. This is some sample text. This is some sample text. This is some sample text.</p>
            </div>
            <div id="team" class="tab-pane fade">
              <h3>
                <spring:message code="aboutOurTeamTitle" />
              </h3>
              <hr />
              <c:forEach var="teaminfo" items="${teaminfos}">
                <div class="team-item col-md-2">
                  <div class="team-item-picture text-center">
                    <a data-toggle="modal" data-target="#${teaminfo.firstname}" href=""> <img class="img-circle" alt=""
                      src="${imgURL}/team1_128x128.jpg" />
                    </a>
                  </div>
                  <div class="team-item-info text-center">
                    <p>${teaminfo.fullname}</p>
                    <p>
                      <span>${teaminfo.position}</span>
                    </p>
                  </div>
                </div>
                <div class="modal fade col-md-12" id="${teaminfo.firstname}" tabindex="-1" aria-labelledby="myModalLabel"
                  aria-hidden="true">
                  <div class="modal-dialog modal-wide60">
                    <div class="modal-content col-md-10">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
                        <h3>${teaminfo.fullname}</h3>
                        <span>${teaminfo.position}</span>
                      </div>
                      <div class="modal-body col-md-12">
                        <div class="about-picture-section col-md-5">
                          <a href="#x" class="thumbnail"> <img alt="" src="${imgURL}/team1.jpg" /></a>
                        </div>
                        <div class="about-information-section col-md-7">
                          <div class="about-information-text">
                            <p>${teaminfo.info}</p>
                          </div>
                          <div class="about-information-contacts">
                            <h2>Contacts:</h2>
                            <p class="icon-phone">
                              <a> ${teaminfo.phone} </a>
                            </p>
                            <br />
                            <p class="icon-envelope">
                              <a> ${teaminfo.email } </a>
                            </p>
                            <p>
                              <a href="https://www.facebook.com/"><img class="social"
                                src="${imgURL}/social/social/Facebook.png" alt="Facebook.png"></a> <a
                                href="https://www.twitter.com/"><img class="social" src="${imgURL}/social/social/Twitter.png"
                                alt="Twitter.png"></a> <a href="https://www.linkedin.com/"><img class="social"
                                src="${imgURL}/social/social/Linkedin.png" alt="Linkedin.png"></a> <a
                                href="https://plus.google.com/"><img class="social"
                                src="${imgURL}/social/social/Google-plus.png" alt="Google-plus.png"></a> <a
                                href="https://www.rss.com/"><img class="social" src="${imgURL}/social/social/RSS.png"
                                alt="RSS.png"></a>
                            </p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
        </div>
      </div>
    </div>
    <jsp:include page="layout/footer.jsp" />
  </div>
</body>
</html>
