Return-Path: <SRS0=lzRC=GN=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F70EC433DB
	for <intel-gfx@archiver.kernel.org>; Sun, 10 Jan 2021 15:35:14 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD8A92333E
	for <intel-gfx@archiver.kernel.org>; Sun, 10 Jan 2021 15:35:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD8A92333E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20AA289D4A;
	Sun, 10 Jan 2021 15:35:13 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0461489CAD;
 Sun, 10 Jan 2021 15:35:11 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E33CFA7DFF;
 Sun, 10 Jan 2021 15:35:11 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chris Wilson" <chris@chris-wilson.co.uk>
Date: Sun, 10 Jan 2021 15:35:11 -0000
Message-ID: <161029291190.22035.8317636343204383822@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210110150404.19535-1-chris@chris-wilson.co.uk>
In-Reply-To: <20210110150404.19535-1-chris@chris-wilson.co.uk>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_series_starting_with_=5B01/11=5D_drm/i915/gt=3A_Limit_VFE_t?=
 =?utf-8?q?hreads_based_on_GT?=
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
Reply-To: intel-gfx@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

PT0gU2VyaWVzIERldGFpbHMgPT0KClNlcmllczogc2VyaWVzIHN0YXJ0aW5nIHdpdGggWzAxLzEx
XSBkcm0vaTkxNS9ndDogTGltaXQgVkZFIHRocmVhZHMgYmFzZWQgb24gR1QKVVJMICAgOiBodHRw
czovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzg1NjgyLwpTdGF0ZSA6IHdhcm5p
bmcKCj09IFN1bW1hcnkgPT0KCiQgZGltIGNoZWNrcGF0Y2ggb3JpZ2luL2RybS10aXAKYjU3NjMw
ODc1MzE5IGRybS9pOTE1L2d0OiBMaW1pdCBWRkUgdGhyZWFkcyBiYXNlZCBvbiBHVAozZGUyYTNl
YWRkYWMgZHJtL2k5MTUvZ3Q6IFJlc3RvcmUgY2xlYXItcmVzaWR1YWwgbWl0aWdhdGlvbnMgZm9y
IEl2eWJyaWRnZSwgQmF5dHJhaWwKY2FhODA0OTRmMTk4IGRybS9pOTE1OiBBbGxvdyB0aGUgc3lz
YWRtaW4gdG8gb3ZlcnJpZGUgc2VjdXJpdHkgbWl0aWdhdGlvbnMKLTo1NDogV0FSTklORzpGSUxF
X1BBVEhfQ0hBTkdFUzogYWRkZWQsIG1vdmVkIG9yIGRlbGV0ZWQgZmlsZShzKSwgZG9lcyBNQUlO
VEFJTkVSUyBuZWVkIHVwZGF0aW5nPwojNTQ6IApuZXcgZmlsZSBtb2RlIDEwMDY0NAoKLToxOTM6
IENIRUNLOlBBUkVOVEhFU0lTX0FMSUdOTUVOVDogQWxpZ25tZW50IHNob3VsZCBtYXRjaCBvcGVu
IHBhcmVudGhlc2lzCiMxOTM6IEZJTEU6IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfbWl0aWdh
dGlvbnMuYzoxMzU6CitNT0RVTEVfUEFSTV9ERVNDKG1pdGlnYXRpb25zLAorIlNlbGVjdGl2ZWx5
IGVuYWJsZSBzZWN1cml0eSBtaXRpZ2F0aW9ucyBmb3IgYWxsIEludGVswq4gR1BVcyBpbiB0aGUg
c3lzdGVtLlxuIgoKdG90YWw6IDAgZXJyb3JzLCAxIHdhcm5pbmdzLCAxIGNoZWNrcywgMTg0IGxp
bmVzIGNoZWNrZWQKNDYwODJmNDYzZTUwIGRybS9pOTE1L2d0OiBSZWFycmFuZ2Ugdmx2IHdvcmth
cm91bmRzCmRiMjk0MzhiZDBmMSBkcm0vaTkxNS9ndDogUmVhcnJhbmdlIGl2YiB3b3JrYXJvdW5k
cwo2NmM3NDE4NTEzODEgZHJtL2k5MTUvZ3Q6IFJlcGxhY2Ugb3Blbi1jb2RlZCBpbnRlbF9lbmdp
bmVfc3RvcF9jcygpCjE2OTVjZTZiNTI2MCBkcm0vaTkxNS9ndDogUmVhcHBseSBwcGd0dCBlbmFi
bGluZyBhZnRlciBlbmdpbmUgcmVzZXRzCmQ0MmFkNWI4YWMxOSBkcm0vaTkxNS9ndDogTGlmdCBz
dG9wX3JpbmcoKSB0byByZXNldF9wcmVwYXJlCjA0ZDYxNDNiNDgyMCBkcm0vaTkxNS9ndDogUHVs
bCByaW5nIHN1Ym1pc3Npb24gcmVzdW1lIHVuZGVyIGl0cyBjYWxsZXIgZm9yY2V3YWtlCjkyZThi
MzcyMjNhZSBkcm0vaTkxNS9zZWxmdGVzdHM6IFByZXBhcmUgdGhlIHNlbGZ0ZXN0cyBmb3IgZW5n
aW5lIHJlc2V0cyB3aXRoIHJpbmcgc3VibWlzc2lvbgowZGVlMzllNWRkZjQgZHJtL2k5MTU6IE1h
cmsgcGVyLWVuZ2luZS1yZXNldCBhcyBzdXBwb3J0ZWQgb24gZ2VuNwoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QK
SW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
