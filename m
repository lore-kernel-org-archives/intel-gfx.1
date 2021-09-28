Return-Path: <SRS0=KIcH=OS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1839FC4332F
	for <intel-gfx@archiver.kernel.org>; Tue, 28 Sep 2021 19:55:23 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1D8A611EF
	for <intel-gfx@archiver.kernel.org>; Tue, 28 Sep 2021 19:55:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D1D8A611EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D046E96C;
	Tue, 28 Sep 2021 19:55:22 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85016E96C
 for <intel-gfx@lists.freedesktop.org>; Tue, 28 Sep 2021 19:55:19 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10121"; a="204281302"
X-IronPort-AV: E=Sophos;i="5.85,330,1624345200"; d="scan'208";a="204281302"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 12:55:19 -0700
X-IronPort-AV: E=Sophos;i="5.85,330,1624345200"; d="scan'208";a="706815137"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 12:55:18 -0700
Date: Tue, 28 Sep 2021 22:55:14 +0300
From: Imre Deak <imre.deak@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Message-ID: <20210928195514.GB2103381@ideak-desk.fi.intel.com>
References: <20210921002313.1132357-1-imre.deak@intel.com>
 <20210921002313.1132357-8-imre.deak@intel.com>
 <689f485c910ca7cce9793fecaa53778950242892.camel@intel.com>
 <20210927214644.GA2043218@ideak-desk.fi.intel.com>
 <c0f746d643195d9f36e990a9489f48a74d2e5508.camel@intel.com>
 <20210928193408.GA2103381@ideak-desk.fi.intel.com>
 <cb65b5ec8453304853616eb52288921ae253cd19.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb65b5ec8453304853616eb52288921ae253cd19.camel@intel.com>
Subject: Re: [Intel-gfx] [PATCH 07/13] drm/i915/tc: Add a mode for the TypeC
 PHY's disconnected state
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Tue, Sep 28, 2021 at 10:45:50PM +0300, Souza, Jose wrote:
> > > [...]
> > > Would not be possible to use TC_PORT_DISCONNECTED when really
> > > disconnected and dropping the use of TC_PORT_TBT_ALT for it?
> > 
> > TC_PORT_DISCONNECTED is the state when the PHY ownership is not held and
> > we don't hold any power domains.
> > 
> > TC_PORT_TBT_ALT is the state when the PHY ownership is not held (like
> > above), and we hold the power domain needed to block TC-cold.
> 
> Swapping it would make modes names do what their names intend to.
> 
> Up to the point that we only had TBT, TC alt and legacy it was fine to
> keep into TBT mode when disconnected but now with a disconnected state
> it do not make sense to keep it in TBT mode when disconnected.
> 
> Or you rename it to TC_PORT_UNKNOWN, as it sets to
> TC_PORT_DISCONNECTED mode during tc_init() and when going to suspend.

Not sure what you mean, because what you describe is what actually
happens. From all states icl_tc_phy_disconnect() will change to
the disconnected state, which is the state at init time and during
suspend or after unloading the driver.

--Imre
