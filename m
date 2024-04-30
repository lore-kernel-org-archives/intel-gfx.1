Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8A6C10F16
	for <intel-gfx@archiver.kernel.org>; Tue, 30 Apr 2024 08:25:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 914B810E734;
	Tue, 30 Apr 2024 08:25:26 +0000 (UTC)
Received: from mail.sig21.net (mail.sig21.net [217.197.84.222])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7579410E734
 for <intel-gfx@lists.freedesktop.org>; Tue, 30 Apr 2024 08:25:25 +0000 (UTC)
Received: from localhorst ([127.0.0.1]) by mail.sig21.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <js@sig21.net>)
 id 1s1ila-0007jz-Tz ; Tue, 30 Apr 2024 10:23:10 +0200
Received: from js by abc.local with local (Exim 4.97)
 (envelope-from <js@sig21.net>) id 1s1ila-000000003lL-1wqi;
 Tue, 30 Apr 2024 10:23:10 +0200
Date: Tue, 30 Apr 2024 10:23:10 +0200
From: Johannes Stezenbach <js@sig21.net>
To: "Saarinen, Jani" <jani.saarinen@intel.com>
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: i915 IVB hangup after resume from s2mem since v6.6.x
Message-ID: <ZjCqbhdSWPiABmRg@sig21.net>
References: <Zi_2OWwG0JGI2j2B@sig21.net>
 <DM8PR11MB5655F60990852E1E4AF760F2E01A2@DM8PR11MB5655.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM8PR11MB5655F60990852E1E4AF760F2E01A2@DM8PR11MB5655.namprd11.prod.outlook.com>
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

Hi Jani,

thank you for the quick response. Currently the machine is in use
and I cannot crash and reboot it at will. I will file the
bug report in the next days when I gathered the requested logs.
I might as well git bisect it, otherwise I guess the root
cause would be hard to find.


Thanks,
Johannes
