Return-Path: <SRS0=kkqM=KG=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3AC4C433B4
	for <intel-gfx@archiver.kernel.org>; Tue, 11 May 2021 14:31:58 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1AEF61260
	for <intel-gfx@archiver.kernel.org>; Tue, 11 May 2021 14:31:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1AEF61260
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203A36EA48;
	Tue, 11 May 2021 14:31:56 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6378E6EA48;
 Tue, 11 May 2021 14:31:55 +0000 (UTC)
IronPort-SDR: OlirTOdNPuHjIHCXGVwf2buxrXTj11LzPtn8Azjqran/tJbaVnOfiX8XPCPer4ANTJw6NVBzU7
 UQdoFJ+AYBng==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="284946111"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="284946111"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 07:31:34 -0700
IronPort-SDR: qCrlyJaXV9SkWdyIBZnuzQfHfOzwIA2iGRu3+gEIzlGkGc3Hzn1V4Z7U4hKBYsQ7qAhxmQvSay
 n9icrFIsSrtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="434471084"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga008.fm.intel.com with SMTP; 11 May 2021 07:31:31 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 11 May 2021 17:31:30 +0300
Date: Tue, 11 May 2021 17:31:30 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Message-ID: <YJqVQsnuQR7nVrnW@intel.com>
References: <20210510133349.14491-1-wse@tuxedocomputers.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210510133349.14491-1-wse@tuxedocomputers.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] [PATCH v7 0/3] drm/i915/display: Try YCbCr420 color
 when RGB fails
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
Cc: airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, May 10, 2021 at 03:33:46PM +0200, Werner Sembach wrote:
> When encoder validation of a display mode fails, retry with less bandwidth
> heavy YCbCr420 color mode, if available. This enables some HDMI 1.4 setups
> to support 4k60Hz output, which previously failed silently.
> =

> AMDGPU had nearly the exact same issue. This problem description is
> therefore copied from my commit message of the AMDGPU patch.
> =

> On some setups, while the monitor and the gpu support display modes with
> pixel clocks of up to 600MHz, the link encoder might not. This prevents
> YCbCr444 and RGB encoding for 4k60Hz, but YCbCr420 encoding might still be
> possible. However, which color mode is used is decided before the link
> encoder capabilities are checked. This patch fixes the problem by retrying
> to find a display mode with YCbCr420 enforced and using it, if it is
> valid.
> =

> This patchset is revision 7. Fixed a rebase issue in 1/3 and moved message
> from error output to debug output in 2/3.

Looks good and CI seem shappy. =


Series pushed to drm-intel-next. Thanks.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
