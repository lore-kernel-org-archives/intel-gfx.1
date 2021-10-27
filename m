Return-Path: <SRS0=h8SK=PP=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54AB7C433F5
	for <intel-gfx@archiver.kernel.org>; Wed, 27 Oct 2021 15:06:40 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8F4860EFF
	for <intel-gfx@archiver.kernel.org>; Wed, 27 Oct 2021 15:06:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E8F4860EFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D25C6E8B2;
	Wed, 27 Oct 2021 15:06:39 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E6BB6E5B6;
 Wed, 27 Oct 2021 15:06:37 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="217353830"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="217353830"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:06:35 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="447254481"
Received: from smaharan-mobl.gar.corp.intel.com (HELO localhost)
 ([10.251.214.195])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:06:30 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Len Baker <len.baker@gmx.com>
Cc: Len Baker <len.baker@gmx.com>, Daniel Vetter <daniel@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20211023115020.GC4145@titan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211003104258.18550-1-len.baker@gmx.com>
 <20211011092304.GA5790@titan> <87k0ihxj56.fsf@intel.com>
 <YWbIQmD1TGikpRm2@phenom.ffwll.local> <20211016111602.GA1996@titan>
 <877deatzz2.fsf@intel.com> <20211023115020.GC4145@titan>
Date: Wed, 27 Oct 2021 18:06:28 +0300
Message-ID: <87ee86h5hn.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Prefer struct_size over open
 coded arithmetic
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

On Sat, 23 Oct 2021, Len Baker <len.baker@gmx.com> wrote:
> Sorry, but I'm missing something here. In linux-next this is the commit
> history of include/linux/stddef.h file:
>
> 3080ea5553cc stddef: Introduce DECLARE_FLEX_ARRAY() helper
> 50d7bd38c3aa stddef: Introduce struct_group() helper macro
> e7f18c22e6be stddef: Fix kerndoc for sizeof_field() and offsetofend()
> 4229a470175b stddef.h: Introduce sizeof_field()
> ...
>
> But in drm-tip this is the commit history:
>
> 4229a470175b stddef.h: Introduce sizeof_field()
> ...
>
> For this patch the DECLARE_FLEX_ARRAY() helper is needed. But the build
> fails due to the last tree commits for stddef.h file are not present.
> So, if I understand correctly, drm-tip is not up to date with linux-next.

linux-next is an ephemeral integration branch for most arch, subsystem
and driver -next branches.

drm-tip is an ephemeral integration branch for drm subsystem and driver
-next branches.

They contain different sets of branches. They are constantly
rebuilt. They are not the end result or end goal.

If a problem (or a solution, for that matter) only exists in the merge
of some of those branches, you can't actually fix it until such a merge
exists somewhere more permanent than an ephemeral integration branch.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
