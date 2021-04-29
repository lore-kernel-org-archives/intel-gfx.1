Return-Path: <SRS0=0ugA=J2=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 916F3C433B4
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Apr 2021 09:10:11 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE1B961449
	for <intel-gfx@archiver.kernel.org>; Thu, 29 Apr 2021 09:10:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE1B961449
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC9E06E1E0;
	Thu, 29 Apr 2021 09:10:09 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C96A6E1BC;
 Thu, 29 Apr 2021 09:10:08 +0000 (UTC)
IronPort-SDR: mikvnmmY5uK/NMnS1Ptz7zWQp6+/8V3llX+y0m1WM/TBIVL2cpQwrh2XTOs/O4TqNRMAVMBWRG
 oZJsO9gk2g/Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="196517137"
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; 
 d="asc'?scan'208";a="196517137"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 02:10:08 -0700
IronPort-SDR: 5CExJuA9et1UQy8sdMxBjOOWRJEemsN9CaKpks1I/9ux4ltCxbTT9wk6qfe7RiOCStPL0BiSBx
 OzjZQvztDXWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; 
 d="asc'?scan'208";a="448360258"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.147])
 by fmsmga004.fm.intel.com with ESMTP; 29 Apr 2021 02:10:06 -0700
Date: Thu, 29 Apr 2021 16:51:42 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Message-ID: <20210429085142.GT1551@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PULL] gvt-next-fixes
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
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>, "Yuan, Hang" <hang.yuan@intel.com>
Content-Type: multipart/mixed; boundary="===============0919453617=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>


--===============0919453617==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/7F8UcOhwbEJvS7n"
Content-Disposition: inline


--/7F8UcOhwbEJvS7n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hi,

Here's just another left fix for possible divide error in vgpu
display rate calculation by Colin.

btw, I'll need a backmerge of linus tree or maybe wait till rc1
to apply gvt mdev dependency fix from https://patchwork.freedesktop.org/series/89479/

Thanks
--
The following changes since commit e65a4d378480101f222e8f6978c22e590c1fb7b5:

  Merge tag 'gvt-next-fixes-2021-04-21' of https://github.com/intel/gvt-linux into drm-intel-next-fixes (2021-04-21 13:22:30 +0300)

are available in the Git repository at:

  https://github.com/intel/gvt-linux tags/gvt-next-fixes-2021-04-29

for you to fetch changes up to d385c16173f28a18866abf54c764200c276dace0:

  drm/i915/gvt: Prevent divided by zero when calculating refresh rate (2021-04-29 17:00:09 +0800)

----------------------------------------------------------------
gvt-next-fixes-2021-04-29

- Fix possible divide error in vgpu display rate calculation (Colin)

----------------------------------------------------------------
Colin Xu (1):
      drm/i915/gvt: Prevent divided by zero when calculating refresh rate

 drivers/gpu/drm/i915/gvt/handlers.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--/7F8UcOhwbEJvS7n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYIpzmAAKCRCxBBozTXgY
JzIyAKCNGatkemRZ8aPMUTBhI2QhitNzYwCfchDWUySiSn3sLPXaEV11KH6LtsY=
=sIsf
-----END PGP SIGNATURE-----

--/7F8UcOhwbEJvS7n--

--===============0919453617==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============0919453617==--
