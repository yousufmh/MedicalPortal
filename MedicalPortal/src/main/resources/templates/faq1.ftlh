<#import "base.ftlh" as base>
<#import "spring.ftl" as spring />

<@base.base pagename="faq" funname="/faq" >

<button class="btn-mainPage m-l-30 m-b-30" onclick="printPage('/faq');">
    <@spring.message "common.pdf"/>
</button>
<div class="container py-5">
    <div class="py-5">
        <div class="row">

            <div class="col-lg-6 m-b-30">
                <!-- Collapse Panel 1-->
                <a data-toggle="collapse" href="#collapseExample1" role="button" aria-expanded="false" aria-controls="collapseExample1" class="btn gold btn-block py-2 shadow-sm with-chevron collapsed">
                <p class="d-flex align-items-center justify-content-between mb-0 px-3 py-2"><strong class="text-uppercase"><@spring.message "faq.cash" /></strong><i class="fa fa-angle-down"></i></p>
            </a>
                <div id="collapseExample1" class="collapse shadow-sm show">
                    <div class="card">
                        <div class="card-body">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">
                                    <p class="font-italic mb-0 ">1.<@spring.message "faq.cash1q" /></p>
                                    <p class="font-italic mb-0 text-muted"><@spring.message "faq.cash1a" /></p>
                                </li>
                                <li class="list-group-item">
                                    <p class="font-italic mb-0 ">
                                        2.<@spring.message "faq.cash2q" />
                                    </p>
                                    <p class="font-italic mb-0 text-muted">
                                        <@spring.message "faq.cash2a" />
                                    </p>
                                </li>
                                <li class="list-group-item">
                                    <p class="font-italic mb-0 ">
                                        3.<@spring.message "faq.cash3q" />
                                    </p>
                                    <p class="font-italic mb-0 text-muted">
                                        <@spring.message "faq.cash3a" />
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 m-b-30">
                <!-- Collapse Panel 3--><a data-toggle="collapse" href="#collapseExample3" role="button" aria-expanded="false" aria-controls="collapseExample3" class="btn gold btn-block py-2 shadow-sm with-chevron collapsed">
                <p class="d-flex align-items-center justify-content-between mb-0 px-3 py-2"><strong class="text-uppercase"><@spring.message "faq.general" /></strong><i class="fa fa-angle-down"></i></p>
            </a>
                <div id="collapseExample3" class="collapse shadow-sm show">
                    <div class="card">
                        <div class="card-body">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">
                                    <p class="font-italic mb-0 ">
                                        1.	<@spring.message "faq.general1q" />
                                    </p>
                                    <p class="font-italic mb-0 text-muted">
                                        <@spring.message "faq.general1a" />
                                    </p>
                                </li>
                                <li class="list-group-item">
                                    <p class="font-italic mb-0 ">
                                        2.	<@spring.message "faq.general2q" />
                                    </p>
                                    <p class="font-italic mb-0 text-muted">
                                        <@spring.message "faq.general2a" />
                                    </p>
                                </li>

                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col m-t-30">
                <!-- Collapse Panel 2-->
                <button data-toggle="collapse" data-target="#collapseExample2" role="button" aria-expanded="false" aria-controls="collapseExample2" class="btn gold btn-block py-2 shadow-sm with-chevron collapsed">
                    <p class="d-flex align-items-center justify-content-between mb-0 px-3 py-2"><strong class="text-uppercase"><@spring.message "faq.preapproval" /></strong><i class="fa fa-angle-down"></i></p>
                </button>
                <div id="collapseExample2" class="collapse shadow-sm show">
                    <div class="card">
                        <div class="card-body">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">
                                    <p class="font-italic mb-0 ">
                                        1.<@spring.message "faq.preapproval1q" />
                                    </p>
                                    <p class="font-italic mb-0 text-muted">
                                        <@spring.message "faq.preapproval1235a" />
                                    </p>
                                </li>
                                <li class="list-group-item">
                                    <p class="font-italic mb-0 ">
                                        2.	<@spring.message "faq.preapproval2q" />
                                    </p>
                                    <p class="font-italic mb-0 text-muted">
                                        <@spring.message "faq.preapproval1235a" />
                                    </p>
                                </li>
                                <li class="list-group-item">
                                    <p class="font-italic mb-0 ">
                                        3.	<@spring.message "faq.preapproval3q" />
                                    </p>
                                    <p class="font-italic mb-0 text-muted">
                                        <@spring.message "faq.preapproval1235a" />
                                    </p>
                                </li>
                                <li class="list-group-item">
                                    <p class="font-italic mb-0 ">
                                        4.	<@spring.message "faq.preapproval4q" />
                                    </p>
                                    <p class="font-italic mb-0 text-muted">
                                        <@spring.message "faq.preapproval4a" />
                                    </p>
                                </li>
                                <li class="list-group-item">
                                    <p class="font-italic mb-0 ">
                                        5.	<@spring.message "faq.preapproval5q" />
                                    </p>
                                    <p class="font-italic mb-0 text-muted">
                                        <@spring.message "faq.preapproval1235a" />
                                    </p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            </div>
    </div>
</div>


</@base.base>