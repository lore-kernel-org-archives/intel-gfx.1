Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3ADECD4855
	for <intel-gfx@archiver.kernel.org>; Tue, 12 May 2026 08:27:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C3F10E689;
	Tue, 12 May 2026 08:27:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z4f4BFBr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5387410E689
 for <intel-gfx@lists.freedesktop.org>; Tue, 12 May 2026 08:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778574431; x=1810110431;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=gh1q1LC2KWhr4Xxwuh2xDLUKpGr8YZYdKX4RPGJSrpg=;
 b=Z4f4BFBrF4wnFTni5vev5uOhrWR8SMy+xG6xydrE2Xt3NqNouPJ440Nv
 8EOpkiHQkf1EtSTcrsg6A+MxGuNb7qxA27f3EfJfFt2G1KrjtZxnTdcHB
 zJ1YQWAwstkYjp3UhsehJq2xpB08+iDjtUvma0gFBAI3hSrcH0hJiN6rB
 xllagEkkfxzJX9pRoLygMvzHOzBq4Ndhda2GKPZG2e0ORI7h5SUVu8EPl
 SiyWOQZogZ6tCAwXymO3Nr54Xs/UD6gWGIF0KB4p8yAjtgEWYBOz3jdhw
 Px0DEcEi2y/HZJanWg+D66whc7c7KQAW7he1gFjOM0JL8P2rDi2W9OsFp A==;
X-CSE-ConnectionGUID: uwO1OBV2SB2gok8f5ke/GQ==
X-CSE-MsgGUID: C4kvneV/R6Sc9dOf7a52lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="67005844"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="67005844"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 01:27:11 -0700
X-CSE-ConnectionGUID: qFZF0W51RPCic3nTTxHd+Q==
X-CSE-MsgGUID: sP0cd3ykT8iBc7OElt32Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="233388486"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.158])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 01:27:10 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Burnfield <daniel.burnfield@gmail.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: Subject: i915 initialization failure on Apple Mac mini 6,1 and
 7,1 with kernel 6.12+
In-Reply-To: <CALQ5wkrXhFBYHYpj1WU6u8unXqwq7jhN9_gheMcc6m12xFG09w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <CALQ5wkrXhFBYHYpj1WU6u8unXqwq7jhN9_gheMcc6m12xFG09w@mail.gmail.com>
Date: Tue, 12 May 2026 11:27:07 +0300
Message-ID: <717ef45f212d203fe27784309fe9b4f29be3e242@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 11 May 2026, Daniel Burnfield <daniel.burnfield@gmail.com> wrote:
> *Request:* Please investigate the PCI bridge resource assignment and
> DMAR-IR regression affecting Apple EFI hardware on kernel 6.12+. These Mac
> mini models are well within the supported hardware range for the i915
> driver and worked correctly on earlier kernels.

Please file a bug as described at [1].

Thanks,
Jani.


[1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html


-- 
Jani Nikula, Intel
