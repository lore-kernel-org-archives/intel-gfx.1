Return-Path: <SRS0=EMYW=LR=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 679AFC4743C
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Jun 2021 12:55:42 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BB8060698
	for <intel-gfx@archiver.kernel.org>; Wed, 23 Jun 2021 12:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BB8060698
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F006E8D9;
	Wed, 23 Jun 2021 12:55:41 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C226E8D9
 for <intel-gfx@lists.freedesktop.org>; Wed, 23 Jun 2021 12:55:40 +0000 (UTC)
IronPort-SDR: VIzt3sY5xiWxatbAwgDVYH2zYIwsavZinz8BsKdGZFy/ZQ3Qj96qeOVz9RY5Poe2+C0hFqyR5l
 41BhkE/goqOw==
X-IronPort-AV: E=McAfee;i="6200,9189,10023"; a="292880441"
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="292880441"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 05:55:40 -0700
IronPort-SDR: hE/vuA5zVkB5bB9KF6BJJMVPDdJHT4w1fOJy7mVkngjJOIHpF6iWRyi5xD2oQoCN0sMWvdEQjR
 WBSPms8xFVyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="444947250"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga007.jf.intel.com with SMTP; 23 Jun 2021 05:55:38 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 23 Jun 2021 15:55:37 +0300
Date: Wed, 23 Jun 2021 15:55:37 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <YNMvSVlVCIB7+gz3@intel.com>
References: <20210608073603.2408-1-ville.syrjala@linux.intel.com>
 <20210608073603.2408-14-ville.syrjala@linux.intel.com>
 <87y2b7uzh7.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87y2b7uzh7.fsf@intel.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-gfx] [PATCH v2 13/17] drm/i915: Deduplicate icl DP HBR2
 vs. eDP HBR3 table
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Fri, Jun 18, 2021 at 03:30:28PM +0300, Jani Nikula wrote:
> On Tue, 08 Jun 2021, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> >
> > The icl combo phy DP HBR2 is identical to the eDP HBR3 table.
> > Get rid of one redundant copy.
> >
> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Pushed up to here. Thanks for the reviews.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
