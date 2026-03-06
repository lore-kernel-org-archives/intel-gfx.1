Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73597F0182B
	for <intel-gfx@archiver.kernel.org>; Fri,  6 Mar 2026 11:44:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11DB910ED03;
	Fri,  6 Mar 2026 11:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lXjGRn5Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD4010ED07;
 Fri,  6 Mar 2026 11:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772797455; x=1804333455;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=20PS3c+U1YMZpbeRKjNjK2/ifTZT6pCSQmUPOxZEiNI=;
 b=lXjGRn5Z+bspGTrWIRxPpnxFTRno6+DOjVoEaGxCysk/jFrsmZSo4ip0
 IXPfD9zyTriKhXPtYLm+J7tRP6FV//U4ULISJ2NN5KxLL1W1aPkw18X1O
 rA0+SNKLuyvOJFOAHcIhjTJlNd7Vv7GxoM5SK9fUSrCGCv9dhSmPDMPvP
 Vii9Gi9W+USlEfM7mOhcgWf5Jw06xQuR3PxJYs+r1/fsYMHK2KYmr1SOP
 yl1Xp+B5w+JyrbxMRKWKjlta5uNmcpoLh0NMT3u7hLaJSOTMcr5AGlEdV
 aVL2DhKyMVp7sui5bR1RQEdom/YWeH2z4JLFLrO7kzkC/Bp9I+/VkPqMt Q==;
X-CSE-ConnectionGUID: qGaHDXBfT9GGWQjRv6MjaA==
X-CSE-MsgGUID: Ui3nwudFR1eiR8Biw5ZkiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73094690"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="73094690"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 03:44:14 -0800
X-CSE-ConnectionGUID: ntlJDwFBSEKSvGUaNJu8xg==
X-CSE-MsgGUID: Y0bMxfCPSD2B8mcKI6ILog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="218222701"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.236])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 03:44:13 -0800
Date: Fri, 6 Mar 2026 12:44:09 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Konstantin Khorenko <khorenko@virtuozzo.com>
Cc: John Harrison <John.C.Harrison@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/guc: fix corrupted copyright symbols in
 selftest files
Message-ID: <aaq-CSoBJl4xxNBp@ashyti-mobl2.lan>
References: <20260209112709.2551603-1-khorenko@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260209112709.2551603-1-khorenko@virtuozzo.com>
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

Hi Konstantin,

On Mon, Feb 09, 2026 at 12:27:09PM +0100, Konstantin Khorenko wrote:
> Replace broken UTF-8 sequences (Unicode replacement characters) with
> proper "©" text in copyright headers.
> 
> Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>

merged to drm-intel-gt-next.

Thanks,
Andi
