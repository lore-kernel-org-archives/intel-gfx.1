Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554FDCA5FED
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Oct 2026 13:42:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B99F310E379;
	Tue,  6 Oct 2026 13:42:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MFwdlxju";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A39A10E3CE
 for <intel-gfx@lists.freedesktop.org>; Tue,  6 Oct 2026 13:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791294155; x=1822830155;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=dlQ40RsHxp5wIoIFK0cPmF6JxbJ8D2CqA2d1ZhCOzFU=;
 b=MFwdlxjuStj0tkiBnS2dWscK9kqfx1NZVUjA470YyNifAIb4zkuEtpn0
 8vXYPzhBeDL4uH9FY/s3FkqPPnAr1113LbEl/frn/o4T9nGqp36axXr3X
 N3ddJZWb9MmDRYofIbRvo9bfOhjJOZbdvA8BLVZDRk1xq0e7GcbcAai4h
 Vg+l10dDLy2X8iQuT/Xfrid2OxsLcifPTsypb554Xi7kTlPGM4wrwodPw
 h9hWbzFt0MpR0V880EW77n56O3GLHf5xDrU4oTjT9s68LisPQxONIJ1ar
 tKDEZ2pukHW51gwRK7C7Pet5/FD+rJ5RfVkOMqBDtpM+B6vsQaBrbOszj A==;
X-CSE-ConnectionGUID: ovjhUVP2TCCw3cMu6WtOTQ==
X-CSE-MsgGUID: cq/8hcAZTwWMKmCY5wpfxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="33710"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="33710"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 06:42:34 -0700
X-CSE-ConnectionGUID: UnnO908yQLy9x/eO1Tw6KQ==
X-CSE-MsgGUID: yDXYsZv4Tny2r5+wS4Hxiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="305091963"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.119])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 06:42:34 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?Q?Andr=C3=A9?= Rodier <andre@rodier.me>,
 intel-gfx@lists.freedesktop.org
Subject: Re: i915: WARNING in intel_modeset_verify_crtc: mismatch in
 set_context_latency (expected 0, found 63616), 7.0.13
In-Reply-To: <7bdded2ad711c4c4bb5c80aea2aed3f546fd4065.camel@rodier.me>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <7bdded2ad711c4c4bb5c80aea2aed3f546fd4065.camel@rodier.me>
Date: Tue, 06 Oct 2026 16:42:31 +0300
Message-ID: <caaa5800b19a470548f7ffc9f62deb3371e12a3a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Fri, 02 Oct 2026, Andr=C3=A9 Rodier <andre@rodier.me> wrote:
> I am forwarding a i915 driver crash, I hope it can be useful.

Please file a bug as described at [1].

[1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html


--=20
Jani Nikula, Intel
