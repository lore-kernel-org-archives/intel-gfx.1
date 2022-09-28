Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50CB7C32771
	for <intel-gfx@archiver.kernel.org>; Wed, 28 Sep 2022 13:21:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F56010E778;
	Wed, 28 Sep 2022 13:21:01 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E678610E76E
 for <intel-gfx@lists.freedesktop.org>; Wed, 28 Sep 2022 13:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664371254; x=1695907254;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=sf11PeZPwyjfYjTStoL7cOdR9koFD/d4FWHKVi1Po1k=;
 b=Egl4zqwfKPrXddTSDpZzzCOADL6a6jD5U69In1PdUIenmt0N8Bh8G6bq
 vUFR6g4WCSF9tDjnq8UJoxAobSSLSN/kFHLq8tdEcSSB7qsiZ2VrkyUq1
 uYGdl5IVxWkGdmI50HvDPpLJUeQ/IzmUQXV1dDIS6GJaamnwe9pYT3sHI
 eAsXdJ322tAvPfNIT7fdBZBDKhepjgavRJ3xwtAC8HttTD8l8QyP6CMBZ
 rnsHHi5d078OC6VId3Q7edB02K+Tml5kiyzAuJkIgPVLbmfqvKQYOUy6i
 3QKsv3wnFhsLtHvT2uK2fFT8OvkjNe7YKhu4q8C51VyjXLvigzYaGn0rz g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="387881240"
X-IronPort-AV: E=Sophos;i="5.93,352,1654585200"; d="scan'208";a="387881240"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 06:20:54 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="747428550"
X-IronPort-AV: E=Sophos;i="5.93,352,1654585200"; d="scan'208";a="747428550"
Received: from novermar-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.61.30])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 06:20:52 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
In-Reply-To: <20220928104434.29586-1-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220928104434.29586-1-ville.syrjala@linux.intel.com>
Date: Wed, 28 Sep 2022 16:20:50 +0300
Message-ID: <87wn9ny6rx.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-gfx] [PATCH 0/4] drm/i915: Per-crtc/connector DRRS
 debugfs
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

On Wed, 28 Sep 2022, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Chang DRRS debugfs to be per-crtc/connector.
>
> Test-with: 20220928060601.12941-2-ville.syrjala@linux.intel.com
>

On the series,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> Ville Syrj=C3=A4l=C3=A4 (4):
>   drm/i915: Move DRRS debugfs next to the implementation
>   drm/i915: Make the DRRS debugfs contents more consistent
>   drm/i915: Make DRRS debugfs per-crtc/connector
>   drm/i915: Fix locking in DRRS debugfs
>
>  .../drm/i915/display/intel_display_debugfs.c  |  98 +---------------
>  drivers/gpu/drm/i915/display/intel_drrs.c     | 108 ++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_drrs.h     |   2 +
>  3 files changed, 113 insertions(+), 95 deletions(-)

--=20
Jani Nikula, Intel Open Source Graphics Center
