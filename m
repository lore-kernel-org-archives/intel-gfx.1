Return-Path: <SRS0=MVSk=JS=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29F27C433ED
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Apr 2021 10:51:56 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA04261447
	for <intel-gfx@archiver.kernel.org>; Wed, 21 Apr 2021 10:51:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA04261447
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0329B6E980;
	Wed, 21 Apr 2021 10:51:55 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B40FB6E97F;
 Wed, 21 Apr 2021 10:51:53 +0000 (UTC)
IronPort-SDR: Jzuz2kSMBk283aV3tStjPWt8EOq4bOGbti/JuoGKld/hQobVT+9a713z5WTMC62Mu4miglh4tr
 FkeoNczuqhLA==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="193555714"
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; d="scan'208";a="193555714"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2021 03:51:53 -0700
IronPort-SDR: yCl+JzMXMuBGSYhmhNYFVWOqxcQNiYP93aTHtFo0zUi+Jqay0BLxz5ekD6SNmy7EeH7AfKxhxv
 7j6f974s2O4A==
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; d="scan'208";a="427469825"
Received: from uchalilx-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.36.64])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2021 03:51:49 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, "Vivi\,
 Rodrigo" <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
In-Reply-To: <20210421094522.GU1551@zhen-hp.sh.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210421094522.GU1551@zhen-hp.sh.intel.com>
Date: Wed, 21 Apr 2021 13:51:46 +0300
Message-ID: <8735vjap19.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PULL] gvt-next-fixes
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>, "Yuan, Hang" <hang.yuan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, 21 Apr 2021, Zhenyu Wang <zhenyuw@linux.intel.com> wrote:
> Hi,
>
> Here're queued gvt-next-fixes changes. Two ones are for code cleanup
> on unused function or duplicated function call, with another one for
> consistent function return type.

Thanks, pulled to drm-intel-next-fixes.

BR,
Jani.


>
> Thanks.
> --
> The following changes since commit d153e8c156dafeb847fd655f416cf81c007e8706:
>
>   Merge tag 'drm-intel-next-fixes-2021-02-25' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2021-02-26 05:08:51 +1000)
>
> are available in the Git repository at:
>
>   https://github.com/intel/gvt-linux tags/gvt-next-fixes-2021-04-21
>
> for you to fetch changes up to 0349ec19c484ed40dbc725820673df4d94334e8c:
>
>   drm/i915/gvt: Remove duplicated register accessible check (2021-04-21 17:56:06 +0800)
>
> ----------------------------------------------------------------
> gvt-next-fixes-2021-04-21
>
> - Remove one unused function warning (Jiapeng)
> - Fix intel_gvt_init_device() return type (Dan)
> - Remove one duplicated register accessible check (Zhenyu)
>
> ----------------------------------------------------------------
> Dan Carpenter (1):
>       drm/i915/gvt: Fix error code in intel_gvt_init_device()
>
> Jiapeng Chong (1):
>       drm/i915/gvt: remove useless function
>
> Zhenyu Wang (1):
>       drm/i915/gvt: Remove duplicated register accessible check
>
>  drivers/gpu/drm/i915/gvt/cmd_parser.c | 5 -----
>  drivers/gpu/drm/i915/gvt/gtt.c        | 6 ------
>  drivers/gpu/drm/i915/gvt/gvt.c        | 8 ++++----
>  3 files changed, 4 insertions(+), 15 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
