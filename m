Return-Path: <SRS0=QVu9=CU=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BFE7C43461
	for <intel-gfx@archiver.kernel.org>; Fri, 11 Sep 2020 12:01:32 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6775221E7
	for <intel-gfx@archiver.kernel.org>; Fri, 11 Sep 2020 12:01:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6775221E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE376EA16;
	Fri, 11 Sep 2020 12:01:31 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89DE46EA14;
 Fri, 11 Sep 2020 12:01:29 +0000 (UTC)
IronPort-SDR: DzZqzmNz7iz+RK3uPbQ2i2jkjyZFjpYaUipkuEeEqZzt8vq8L6aw4+EiAf8o3i54p+W4HfPiTz
 mqXcytHjY+Iw==
X-IronPort-AV: E=McAfee;i="6000,8403,9740"; a="146432591"
X-IronPort-AV: E=Sophos;i="5.76,415,1592895600"; d="scan'208";a="146432591"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2020 05:01:28 -0700
IronPort-SDR: a9pMyalGJOKmQaIEnffU9spSDOV4ysrNaUq5VKZVXWyLggHIODc1D7q2qM98mBMdMlok9LdKKZ
 10L8GVUmuMfA==
X-IronPort-AV: E=Sophos;i="5.76,415,1592895600"; d="scan'208";a="300911080"
Received: from jkrzyszt-desk.igk.intel.com ([172.22.244.18])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2020 05:01:26 -0700
Message-ID: <f3fb5a6555cc4d6e89fbbc3ae3fefb03b753c11c.camel@linux.intel.com>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Petri Latvala <petri.latvala@intel.com>
Date: Fri, 11 Sep 2020 14:01:23 +0200
In-Reply-To: <20200911115216.GN7444@platvala-desk.ger.corp.intel.com>
References: <20200911103039.4574-1-janusz.krzysztofik@linux.intel.com>
 <20200911103039.4574-25-janusz.krzysztofik@linux.intel.com>
 <20200911115216.GN7444@platvala-desk.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH i-g-t v6 24/24] tests/core_hotunplug: Add
 unbind-rebind subtest to BAT scope
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Fri, 2020-09-11 at 14:52 +0300, Petri Latvala wrote:
> On Fri, Sep 11, 2020 at 12:30:39PM +0200, Janusz Krzysztofik wrote:
> > Subject: [PATCH i-g-t v6 24/24] tests/core_hotunplug: Add unbind-rebind subtest to BAT scope
> 
> Same here, prefix with intel-ci
> 

Sure.

Thanks,
Janusz

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
