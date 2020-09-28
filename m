Return-Path: <SRS0=y0J5=DF=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B96C2D0A8
	for <intel-gfx@archiver.kernel.org>; Mon, 28 Sep 2020 17:15:21 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 493B820774
	for <intel-gfx@archiver.kernel.org>; Mon, 28 Sep 2020 17:15:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 493B820774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D0189F55;
	Mon, 28 Sep 2020 17:15:20 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E44489F55;
 Mon, 28 Sep 2020 17:15:19 +0000 (UTC)
IronPort-SDR: CzkHPyk5Y0va+IYn37xNcDCt5cDJfG7SMtQOiqWM/D8WpTCI2J/RxmbqY7Qk9/0LakNq5R/kar
 Z04ZftGuxInQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="223624475"
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; d="scan'208";a="223624475"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 10:15:17 -0700
IronPort-SDR: sdwvITrZwIodaSl3A6uuocAozDR0/EXh0gkaRVGOgxYVobRJFQGzIM/fU9bE8PaJdxtkLclvpe
 Ra48h5Rv71UA==
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; d="scan'208";a="338261563"
Received: from lizwalsh-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.251.86.12])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 10:15:12 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Surendrakumar Upadhyay\,
 TejaskumarX" <tejaskumarx.surendrakumar.upadhyay@intel.com>, "Vivi\,
 Rodrigo" <rodrigo.vivi@intel.com>, "airlied\@linux.ie" <airlied@linux.ie>,
 "daniel\@ffwll.ch" <daniel@ffwll.ch>,
 "intel-gfx\@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel\@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Ausmus\,
 James" <james.ausmus@intel.com>, "Roper\,
 Matthew D" <matthew.d.roper@intel.com>, "Souza\, Jose" <jose.souza@intel.com>,
 "ville.syrjala\@linux.intel.com" <ville.syrjala@linux.intel.com>, "De Marchi\,
 Lucas" <lucas.demarchi@intel.com>, "Pandey\, Hariom" <hariom.pandey@intel.com>
In-Reply-To: <SN6PR11MB3421725FE60CC7930FC02AB6DF350@SN6PR11MB3421.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200928080931.246347-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <20200928080931.246347-3-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <87a6xaow40.fsf@intel.com>
 <SN6PR11MB3421725FE60CC7930FC02AB6DF350@SN6PR11MB3421.namprd11.prod.outlook.com>
Date: Mon, 28 Sep 2020 20:15:29 +0300
Message-ID: <871rilq0um.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/edp/jsl: Update vswing table
 for HBR and HBR2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Mon, 28 Sep 2020, "Surendrakumar Upadhyay, TejaskumarX"	<tejaskumarx.surendrakumar.upadhyay@intel.com> wrote:
> This is a good example of a potential trap that having
> IS_ELKHARTLAKE() cover both ELK and JSP creates. An unsuspecting coder
> might change the if ladder to have IS_ELKHARTLAKE() first, and the
> subsequent IS_JASPERLAKE() branch would never be taken.
>
> BR,
> Jani.
>
> Tejas : In that case I will put attention note in comment about
> platform checks such that ladder distrubance can be avoided. What you
> suggest?

The solution is to make IS_ELKHARTLAKE() mean ELK and only ELK.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
